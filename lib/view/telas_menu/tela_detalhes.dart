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
    // Receber os dados que foram enviados por argumento
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, int>?;

    if (args == null) {
      return Scaffold(
        body: Center(child: Text('Erro: Nenhum argumento recebido!')),
      );
    }

    final int catIndex = args['catIndex']!;
    final int itemIndex = args['itemIndex']!;

    // Retornar o item a partir do índice da categoria e do item
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Exibir a imagem do item com bordas arredondadas
            ClipRRect(
              borderRadius: BorderRadius.circular(20), // Bordas arredondadas
              child: Image.asset(
                item.imagem,
                width: 400,
                height: 350,
                fit: BoxFit.cover, // Ajusta a imagem para cobrir o espaço
              ),
            ),
            SizedBox(height: 20),
            // Nome e detalhes do item
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
            // Controles de quantidade
            SizedBox(height: 20),
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
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  PedidoService.adicionarPedido(Item(
                    item.nome,
                    item.descricao,
                    item.preco,
                    item.imagem,
                    quantidade:
                        quantidade, // Aqui estamos passando a quantidade
                  ));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          '$quantidade ${item.nome} adicionado(s) à lista de pedidos!'),
                    ),
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.all(16.0), // Ajusta o tamanho do botão
                  child: Text(
                    'Adicionar ao Pedido',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
