import 'package:cardapio/estilos.dart';
import 'package:cardapio/model/categoria.dart';
import 'package:cardapio/service/item_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final ItemService srv = GetIt.instance<ItemService>();

class TelaMenu extends StatefulWidget {
  const TelaMenu({super.key});

  @override
  State<TelaMenu> createState() => _TelaMenuState();
}

class _TelaMenuState extends State<TelaMenu> {
  List<Categoria> listaMenu = [];

  @override
  void initState() {
    super.initState();
    listaMenu = srv.gerarMenu(); // Atualiza a variável de instância
    setState(() {}); // Força a reconstrução da tela
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
        centerTitle: true, // Centraliza o título
        backgroundColor: cor4,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.logout,
            color: const Color.fromARGB(255, 126, 0, 0),
          ),
          onPressed: () {
            Navigator.pushNamed(
                context, 'login');
          },
        ),
      ),
      backgroundColor: cor2,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: listaMenu.length,
          itemBuilder: (context, catIndex) {
            final categoria = listaMenu[catIndex];
            return Card(
              color: cor3, // Cor de fundo do Card
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      categoria.categoria,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    children:
                        categoria.lista_itens.asMap().entries.map((entry) {
                      final itemIndex = entry.key;
                      final item = entry.value;
                      return ListTile(
                        title: Text(item.nome),
                        trailing: Text(
                          'R\$ ${item.preco.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 17),
                        ), // Exibe o preço
                        // Mostra a imagem à esquerda
                        leading: Image.asset(
                          item.imagem,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            'detalhes',
                            arguments: {
                              'catIndex': catIndex, // Índice da categoria
                              'itemIndex': itemIndex // Índice do item
                            },
                          );
                        },
                      );
                    }).toList(), // Converte para uma lista de widgets
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'pedidos');
        },
        child: Icon(Icons.receipt_long),
        backgroundColor: cor4,
        foregroundColor: cor1,
      ),
    );
  }
}
