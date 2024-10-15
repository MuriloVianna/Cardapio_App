import 'package:cardapio/service/item_service.dart';
import 'package:cardapio/view/telas_menu/tela_menu.dart';
import 'package:cardapio/view/telas_menu/tela_pedidos.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'view/telas_login/login_page.dart';
import 'package:cardapio/view/telas_login/tela_cadastro.dart';
import 'package:cardapio/view/telas_login/tela_esqueceu_senha.dart';

import 'view/telas_menu/tela_detalhes.dart';

//
// INICIALIZAR o localizador de serviço GET_IT
//
final getIt = GetIt.instance;

void main() {
  //
  // REGISTRAR os serviços
  //
  getIt.registerSingleton<ItemService>(ItemService());

  var srv = getIt<ItemService>();

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false, //Tira o banner de debug da lateral
      initialRoute: 'menu', //Tela que o app inicia
      routes: {
        'login': (context) => LoginPage(
              onTap: () {},
            ), //Tela de login
        'cadastro': (context) => TelaCadastro(
              onTap: () {},
            ), //Tela de cadastro
        'esqueceu': (context) => TelaEsqueceuSenha(), //Tela de esqueceu a senha
        'menu': (context) => TelaMenu(),
        'detalhes': (context) => TelaDetalhes(),
        'pedidos': (context) => TelaPedidos(),
      },
    );
  }
}
