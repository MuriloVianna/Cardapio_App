import 'package:flutter/material.dart';
import 'package:cardapio/model/item.dart';
import 'package:cardapio/service/pedido_service.dart';

import '../../estilos.dart';

class TelaPedidos extends StatelessWidget {
  const TelaPedidos({super.key});

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
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(
                context, 'menu'); // Função para voltar para a tela anterior
          },
        ),
      ),
      backgroundColor: cor1,
      body: RefreshIndicator(
        onRefresh: () async {
          // Lógica para atualizar os pedidos (se necessário)
        },
        child: FutureBuilder<List<Item>>(
          future: Future.value(PedidoService
              .obterPedidos()), // Simulando a recuperação dos pedidos
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Erro: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('Nenhum pedido encontrado.'));
            }

            // Se houver pedidos, exiba-os
            final pedidos = snapshot.data!;
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              physics: const AlwaysScrollableScrollPhysics(),
              separatorBuilder: (_, index) => const SizedBox(height: 10),
              itemBuilder: (_, index) {
                return PedidoTile(item: pedidos[index]);
              },
              itemCount: pedidos.length,
            );
          },
        ),
      ),
    );
  }
}

class PedidoTile extends StatelessWidget {
  final Item item;

  const PedidoTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(item.nome),
        trailing: Text('R\$ ${item.preco.toStringAsFixed(2)}'),
      ),
    );
  }
}
