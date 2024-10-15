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
          title: const Text('Pedidos'),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            'Nenhum item no pedido!',
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    }

    // Calcula o valor total dos pedidos
    double total = PedidoService.calcularTotal();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
        centerTitle: true,
      ),
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
                                Text(item.nome),
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
                                              item.quantidade--; // Decrementa a quantidade
                                            } else {
                                              PedidoService.removerPedido(
                                                  item); // Remove o item se a quantidade for 1
                                            }
                                          });
                                        },
                                      ),
                                      Text(
                                        '${item.quantidade}', // Exibe a quantidade atual
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: () {
                                          setState(() {
                                            item.quantidade++; // Incrementa a quantidade
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  // Ícone da lixeira
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      setState(() {
                                        PedidoService.removerPedido(
                                            item); // Remove o item
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
                // Aqui você pode adicionar a lógica para confirmar o pedido
                // Por exemplo, redirecionar para uma tela de confirmação
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Pedido confirmado com sucesso!')),
                );
                // Navegar para a tela de confirmação final (opcional)
                // Navigator.pushNamed(context, '/telaConfirmacao');
              },
              child: Text('Confirmar Pedido'),
              style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  textStyle: TextStyle(fontSize: 20),
                  backgroundColor: cor9, // Cor do botão
                  foregroundColor: cor1),
            ),
          ],
        ),
      ),
    );
  }
}
