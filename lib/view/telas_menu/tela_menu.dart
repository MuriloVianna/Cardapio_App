import 'package:cardapio/estilos.dart';
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
  Future<List<Categoria>>? futureCategorias;

  @override
  void initState() {
    super.initState();
    futureCategorias = srv.gerarMenu(); 
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
        backgroundColor: cor4,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.logout,
            color: const Color.fromARGB(255, 126, 0, 0),
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'login');
          },
        ),
      ),
      backgroundColor: cor2,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: FutureBuilder<List<Categoria>>(
          future: futureCategorias,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Erro ao carregar o menu'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                  child: Text('Nenhuma categoria ou item encontrado'));
            } else {
              final categorias = snapshot.data!;

              return ListView.builder(
                itemCount: categorias.length,
                itemBuilder: (context, catIndex) {
                  final categoria = categorias[catIndex];
                  final itensDaCategoria = categoria.listaItens;

                  return Card(
                    color: cor3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            categoria.nome,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Column(
                          children: itensDaCategoria.map((item) {
                            return ListTile(
                              title: Text(item.nome),
                              trailing: Text(
                                'R\$ ${item.preco.toStringAsFixed(2)}',
                                style: TextStyle(fontSize: 17),
                              ),
                              leading: Image.network(
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
                                    'categoriaNome': categoria.nome, 
                                    'itemIndex': itensDaCategoria.indexOf(item), 
                                  },
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
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
