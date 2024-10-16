import 'package:cardapio/estilos.dart';
import 'package:flutter/material.dart';
import 'package:cardapio/service/pedido_service.dart';
import 'package:cardapio/model/item.dart';

class TelaPedidos extends StatefulWidget {
  const TelaPedidos({Key? key}) : super(key: key);

  @override
  _TelaPedidosState createState() => _TelaPedidosState();
}

class _TelaPedidosState extends State<TelaPedidos> {
  @override
  Widget build(BuildContext context) {
    // Obtém a lista de pedidos
    List<Item> pedidos = PedidoService.obterPedidos();

    // Debug para verificar o que está sendo retornado
    print("Pedidos atuais: ${pedidos.map((item) => item.nome).toList()}");

    if (pedidos.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text(
              "Pedidos",
              style: logo.copyWith(fontSize: 40),
            ),
          ),
          centerTitle: true, // Centraliza o título
          backgroundColor: cor4,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: cor1,
            ),
            onPressed: () {
              Navigator.pushNamed(
                  context, 'menu'); // Função para voltar para a tela anterior
            },
          ),
        ),
        backgroundColor: cor2,
        body: Center(
          child: Column(
            mainAxisSize:
                MainAxisSize.min, // Para centralizar no meio verticalmente
            children: [
              Text(
                'Nenhum item no pedido!',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20), // Espaçamento entre o texto e o botão
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, 'menu'); // Redireciona para o menu
                },
                child: Text('Adicionar Itens'),
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  textStyle: TextStyle(fontSize: 18),
                  backgroundColor: cor4, // Cor de fundo do botão
                  foregroundColor: cor1, // Cor do texto
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Calcula o valor total dos pedidos
    double total = PedidoService.calcularTotal();

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text(
            "Pedidos",
            style: logo.copyWith(fontSize: 40),
          ),
        ),
        centerTitle: true, // Centraliza o título
        backgroundColor: cor4,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: cor1,
          ),
          onPressed: () {
            Navigator.pushNamed(
                context, 'menu'); // Função para voltar para a tela anterior
          },
        ),
      ),
      backgroundColor: cor2,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: pedidos.length,
                itemBuilder: (context, index) {
                  final item = pedidos[index];

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Coluna para o nome do item e os preços
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.nome,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Preço unitário: R\$ ${item.preco.toStringAsFixed(2)}',
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  'Preço total: R\$ ${(item.preco * item.quantidade).toStringAsFixed(2)}',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          // Row para os botões de quantidade e o ícone da lixeira
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Coluna para os botões de quantidade e o ícone da lixeira
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Botões de quantidade
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.remove),
                                        onPressed: () {
                                          setState(() {
                                            if (item.quantidade > 1) {
                                              item.quantidade--;
                                            } else {
                                              PedidoService.removerPedido(
                                                  item); // Remove o item se a quantidade for 1
                                            }
                                          });
                                        },
                                      ),
                                      Text(
                                        '${item.quantidade}',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: () {
                                          setState(() {
                                            item.quantidade++;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  // Ícone da lixeira
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        PedidoService.removerPedido(item);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Total do Pedido: R\$ ${total.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Pedido confirmado com sucesso!')),
                );
              },
              child: Text('Confirmar Pedido'),
              style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  textStyle: TextStyle(fontSize: 20),
                  backgroundColor: cor9,
                  foregroundColor: cor1),
            ),
          ],
        ),
      ),
    );
  }
}
