import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  final String id; 
  final String nome;
  final String descricao;
  final double preco;
  final String imagem;
  final bool ativo;
  final String categoria;
  int quantidade;

  Item({
    required this.id, 
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.imagem,
    required this.ativo,
    required this.categoria,
    this.quantidade = 1,
  });

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'descricao': descricao,
      'preco': preco,
      'imagem': imagem,
      'ativo': ativo,
      'categoria': categoria,
      'quantidade': quantidade,
    };
  }

  // Método fromJson para tratar 'categoria' como string
  factory Item.fromJson(Map<String, dynamic> json, String id) {
    return Item(
      id: id, // Passa o ID que vem do Firestore
      nome: json['nome'] ?? 'Nome não disponível',
      descricao: json['descricao'] ?? 'Descrição não disponível',
      preco: (json['preco'] ?? 0).toDouble(),
      imagem: json['imagem'] ?? 'url_imagem_padrao',
      ativo: json['ativo'] ?? false,
      categoria: json['categoria'] ??
          'Categoria não disponível',
      quantidade: json['quantidade'] ?? 1,
    );
  }
}

class Categoria {
  final String nome;
  final String descricao;
  final String imagem;
  final int ordem;
  List<Item> listaItens;

  Categoria(
    this.nome,
    this.descricao,
    this.imagem,
    this.ordem,
    this.listaItens,
  );

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'descricao': descricao,
      'imagem': imagem,
      'ordem': ordem,
      'itens': listaItens.map((item) => item.toJson()).toList(),
    };
  }

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      json['nome'] ?? 'Categoria não disponível',
      json['descricao'] ?? 'Descrição não disponível',
      json['imagem'] ?? 'url_imagem_padrao',
      json['ordem'] ?? 0,
      [], // Inicializa a lista de itens vazia
    );
  }
}

// Serviço para gerenciar o menu com o Firestore
class ItemService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Categoria>> gerarMenu() async {
    List<Categoria> categorias = [];

    try {
      // Obter categorias do Firestore
      QuerySnapshot categoriaSnapshot =
          await _firestore.collection('categorias').get();

      if (categoriaSnapshot.docs.isEmpty) {
        throw Exception("Nenhuma categoria encontrada.");
      }

      // Obter todos os itens do cardápio
      QuerySnapshot itemSnapshot = await _firestore
          .collection('itens_cardapio')
          .where('ativo', isEqualTo: true)
          .get();

      if (itemSnapshot.docs.isEmpty) {
        throw Exception("Nenhum item ativo encontrado.");
      }

      // Criar um mapa para categorizar os itens
      Map<String, List<Item>> itensPorCategoria = {};
      for (var itemDoc in itemSnapshot.docs) {
        final item =
            Item.fromJson(itemDoc.data() as Map<String, dynamic>, itemDoc.id);
        if (!itensPorCategoria.containsKey(item.categoria)) {
          itensPorCategoria[item.categoria] = [];
        }
        itensPorCategoria[item.categoria]?.add(item);
      }

      // Associa os itens às suas respectivas categorias
      for (var doc in categoriaSnapshot.docs) {
        Categoria categoria =
            Categoria.fromJson(doc.data() as Map<String, dynamic>);

        // Adiciona a lista se o item pertence a categoria
        categoria.listaItens = itensPorCategoria[categoria.nome] ?? [];

        categorias.add(categoria);
      }
    } catch (e) {
      print('Erro ao obter categorias ou itens do Firestore: $e');
      throw Exception('Erro ao carregar o menu: $e');
    }

    return categorias;
  }

  // Método para retornar todos os itens do cardápio
  Future<List<Item>> obterItens() async {
    try {
      final snapshot = await _firestore.collection('itens_cardapio').get();

      if (snapshot.docs.isEmpty) {
        throw Exception("Nenhum item encontrado no cardápio.");
      }

      return snapshot.docs.map((doc) {
        return Item.fromJson(doc.data() as Map<String, dynamic>,
            doc.id); // Passa o doc.id (ID do Firestore) para o fromJson
      }).toList();
    } catch (e) {
      throw Exception('Erro ao obter itens: $e');
    }
  }

  Future<Item> retornaItem(String categoriaNome, int itemIndex) async {
    try {
      List<Categoria> categorias = await gerarMenu();
      final categoria = categorias.firstWhere(
        (cat) => cat.nome == categoriaNome,
        orElse: () => throw Exception('Categoria não encontrada'),
      );

      print("Categoria encontrada: ${categoria.nome}");

      if (categoria.listaItens.isEmpty) {
        throw Exception('Não há itens disponíveis nesta categoria.');
      }

      if (itemIndex >= categoria.listaItens.length || itemIndex < 0) {
        throw Exception('Índice do item fora do alcance.');
      }

      final item = categoria.listaItens[itemIndex];
      print("Item encontrado: ${item.nome}");
      return item;
    } catch (e) {
      print("Erro ao buscar item: $e");
      throw Exception('Erro ao buscar item: $e');
    }
  }
}
