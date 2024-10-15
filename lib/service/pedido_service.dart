import '../model/item.dart';

class PedidoService {
  static final List<Item> pedidos = [];

  static void adicionarPedido(Item item) {
    // Verifica se o item já está na lista de pedidos
    final existingItemIndex = pedidos.indexWhere(
      (pedido) => pedido.nome == item.nome,
    );

    if (existingItemIndex != -1) {
      // Se o item já existe, incrementa a quantidade
      pedidos[existingItemIndex].quantidade += item.quantidade;
    } else {
      // Se não, adiciona o novo item à lista
      pedidos.add(Item(
        item.nome,
        item.descricao,
        item.preco,
        quantidade: item.quantidade, // Passa a quantidade ao novo item
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

  static void finalizarPedido() {
    pedidos.clear(); // Limpa o pedido após finalizar
  }
}
