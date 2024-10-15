// import 'package:cardapio/estilos.dart';
// import 'package:cardapio/model/item.dart';
// import 'package:cardapio/service/item_service.dart';
// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';

// //
// // UTILIZAR (injetar) o serviço ContatoService
// //
// final ItemService srv = GetIt.instance<ItemService>();

// class TelaDetalhes extends StatefulWidget {
//   const TelaDetalhes({super.key});

//   @override
//   State<TelaDetalhes> createState() => _TelaDetalhesState();
// }

// class _TelaDetalhesState extends State<TelaDetalhes> {
//   @override
//   Widget build(BuildContext context) {
//     //
//     // Receber os dados que foram enviados por argumento
//     //
//     final int idItem = ModalRoute.of(context)!.settings.arguments as int;

//     //
//     // TO-DO: Retornar o item a partir do ID
//     //
//     var item = srv.retornaItem(idItem);

//     return Scaffold(
//       appBar: AppBar(
//         title: Padding(
//           padding: EdgeInsets.only(bottom: 12),
//           child: Text(
//             "Ana's Coffee",
//             style: logo.copyWith(fontSize: 40),
//           ),
//         ),
//         backgroundColor: cor9,
//         automaticallyImplyLeading: false,
//       ),
//       backgroundColor: cor1,
//       body: Padding(
//         padding: EdgeInsets.all(20),
//         child: ListView(
//           children: [
//             //imagem
//             //
//             exibirCampoTexto('Nome', item.nome)
//           ],
//         ),
//       ),
//     );
//   }

//   exibirCampoTexto(label, texto) {
//     return ListTile(
//       title: Text(label, style: TextStyle(fontSize: 12)),
//       subtitle: Text(texto, style: TextStyle(fontSize: 22)),
//     );
//   }
// }
