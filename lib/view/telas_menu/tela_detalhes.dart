import 'package:cardapio/estilos.dart';
import 'package:cardapio/model/item.dart';
import 'package:cardapio/service/item_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../service/pedido_service.dart';

//
// UTILIZAR (injetar) o serviço ItemService
//
final ItemService srv = GetIt.instance<ItemService>();

class TelaDetalhes extends StatefulWidget {
  const TelaDetalhes({super.key});

  @override
  State<TelaDetalhes> createState() => _TelaDetalhesState();
}

class _TelaDetalhesState extends State<TelaDetalhes> {
  int quantidade = 1; // Variável para controlar a quantidade

  @override
  Widget build(BuildContext context) {
    //
    // Receber os dados que foram enviados por argumento
    // Exemplo: {'catIndex': 0, 'itemIndex': 1}
    //
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, int>?;

    if (args == null) {
      return Scaffold(
        body: Center(child: Text('Erro: Nenhum argumento recebido!')),
      );
    }

    final int catIndex = args['catIndex']!;
    final int itemIndex = args['itemIndex']!;

    //
    // Retornar o item a partir do índice da categoria e do item
    //
    var item = srv.retornaItem(catIndex, itemIndex);

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text(
            "Ana's Coffee",
            style: logo.copyWith(fontSize: 40),
          ),
        ),
        backgroundColor: cor9,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Função para voltar para a tela anterior
          },
        ),
      ),
      backgroundColor: cor1,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            // Exibir o nome e outros detalhes do item
            Text(
              item.nome,
            ),
            Text(item.descricao),
            Text('Preço R\$ ${item.preco.toStringAsFixed(2)}'),

            // Controles de quantidade
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (quantidade > 1) {
                        quantidade--; // Decrementa a quantidade
                      }
                    });
                  },
                ),
                Text(
                  '$quantidade', // Exibe a quantidade atual
                  style: TextStyle(fontSize: 20),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      quantidade++; // Incrementa a quantidade
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),

            // Botão para adicionar ao pedido
            ElevatedButton(
              onPressed: () {
                PedidoService.adicionarPedido(Item(
                  item.nome,
                  item.descricao,
                  item.preco,
                  quantidade: quantidade, // Aqui estamos passando a quantidade
                ));

                print("Adicionando ${quantidade}x ${item.nome} ao pedido");

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                          '$quantidade ${item.nome} adicionado(s) à lista de pedidos!')),
                );
              },
              child: Text('Adicionar ao Pedido'),
            )
          ],
        ),
      ),
    );
  }

  exibirCampoTexto(String label, String texto) {
    return ListTile(
      title: Text(label, style: TextStyle(fontSize: 12)),
      subtitle: Text(texto, style: TextStyle(fontSize: 22)),
    );
  }
}
