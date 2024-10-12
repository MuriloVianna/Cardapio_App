import 'package:cardapio/estilos.dart';
import 'package:cardapio/model/categoria.dart';
import 'package:cardapio/service/item_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

//
// UTILIZAR (injetar) o serviço ContatoService
//
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
    listaMenu = ItemService.gerarMenu(); // Atualiza a variável de instância
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
        backgroundColor: cor9,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: cor1,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: listaMenu.length,
            itemBuilder: (context, index) {
              final categoria = listaMenu[index];
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        categoria.categoria,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      children: categoria.lista_itens.map((item) {
                        return ListTile(
                          title: Text(item.nome), // Exibe o nome do item
                          //subtitle: Text(item.descricao), // Exibe a descrição do item
                          trailing: Text(
                              'R\$ ${item.preco.toStringAsFixed(2)}'), // Exibe o preço
                        );
                      }).toList(), // Converte para uma lista de widgets
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
