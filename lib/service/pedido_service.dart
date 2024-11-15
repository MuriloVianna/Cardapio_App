import 'package:cardapio/service/item_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PedidoService {
  static final List<Item> pedidos = [];

  static void adicionarPedido(Item item) {
    // Verifica se o item já está na lista de pedidos
    final existingItemIndex = pedidos.indexWhere(
      (pedido) => pedido.id == item.id, // Verifica pelo 'id', não pelo nome
    );

    if (existingItemIndex != -1) {
      // Se o item já existe, incrementa a quantidade
      pedidos[existingItemIndex].quantidade += item.quantidade;
    } else {
      // Se não, adiciona o novo item à lista com o 'id' e os valores corretos
      pedidos.add(Item(
        id: item.id, 
        nome: item.nome,
        descricao: item.descricao,
        preco: item.preco,
        imagem: item.imagem,
        ativo: item.ativo, 
        categoria: item.categoria, 
        quantidade: item.quantidade, 
      ));
    }
  }

  static void removerPedido(Item item) {
    pedidos.remove(item);
  }

  static List<Item> obterPedidos() {
    return pedidos;
  }

  static double calcularTotal() {
    return pedidos.fold(
        0, (total, item) => total + (item.preco * item.quantidade));
  }

  static Future<void> finalizarPedido(String uidCliente) async {
    final firestore = FirebaseFirestore.instance;

    try {
      // Adiciona o documento do pedido principal na coleção 'pedidos'
      DocumentReference pedidoRef = await firestore.collection('pedidos').add({
        'uid': uidCliente,
        'status': 'preparando', // Status inicial do pedido
        'data_hora': Timestamp.fromDate(DateTime.now()), // Data e hora atuais
      });

      // Itera sobre cada item no pedido e adiciona à subcoleção 'itens'
      for (var item in pedidos) {
        await pedidoRef.collection('itens').add({
          'item_id': item.id,
          'preco': item.preco,
          'quantidade': item.quantidade,
        });
      }

      // Limpa a lista de pedidos após adicionar todos os itens ao Firestore
      pedidos.clear();
    } catch (e) {
      print('Erro ao finalizar o pedido: $e');
    }
  }
}
