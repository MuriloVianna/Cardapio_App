import 'package:cardapio/estilos.dart';
import 'package:cardapio/service/item_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../service/pedido_service.dart';

final ItemService srv = GetIt.instance<ItemService>();

class TelaDetalhes extends StatefulWidget {
  const TelaDetalhes({super.key});

  @override
  State<TelaDetalhes> createState() => _TelaDetalhesState();
}

class _TelaDetalhesState extends State<TelaDetalhes> {
  int quantidade = 1;
  Future<Item>? futureItem;

  @override
  void initState() {
    super.initState();

    // Adicionando verificação dos argumentos após o carregamento da tela
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

      // Imprimindo os argumentos para depuração
      print("Argumentos recebidos: $args");

      if (args == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Erro: Argumentos não fornecidos!")),
        );
        return;
      }

      final String? categoriaNome = args['categoriaNome'] as String?;
      final int? itemIndex = args['itemIndex'] as int?;

      // Verificar se ambos os argumentos estão corretos
      print("categoriaNome: $categoriaNome");
      print("itemIndex: $itemIndex");

      if (categoriaNome != null && itemIndex != null) {
        // Carregar o item com base nos argumentos passados
        futureItem = srv.retornaItem(categoriaNome, itemIndex);
        setState(
            () {}); // Atualizar o estado para refletir o carregamento do item
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  "Erro: Argumentos 'categoriaNome' ou 'itemIndex' faltando!")),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text(
            "Ana's Coffee",
            style: logo.copyWith(fontSize: 40),
          ),
        ),
        centerTitle: true,
        backgroundColor: cor9,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: cor1,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: cor1,
      body: FutureBuilder<Item>(
        future: futureItem,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao carregar item: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData) {
            return Center(child: Text('Item não encontrado'));
          }

          final item = snapshot.data!;

          return SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    item.imagem,
                    width: 400,
                    height: 350,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  item.nome,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  item.descricao,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'Preço: R\$ ${item.preco.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, color: cor9),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (quantidade > 1) {
                            quantidade--;
                          }
                        });
                      },
                    ),
                    Text(
                      '$quantidade',
                      style: TextStyle(fontSize: 20),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          quantidade++;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      PedidoService.adicionarPedido(
                        Item(
                          id: item.id, // Passando o 'id' corretamente
                          nome: item.nome,
                          descricao: item.descricao,
                          preco: item.preco,
                          imagem: item.imagem,
                          ativo: item.ativo,
                          categoria: item.categoria,
                          quantidade: quantidade,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              '$quantidade ${item.nome} adicionado(s) à lista de pedidos!'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: cor9,
                      foregroundColor: cor1,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Adicionar ao Pedido',
                        style: textoLogin.copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
