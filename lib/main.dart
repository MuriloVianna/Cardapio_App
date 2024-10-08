import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'view/login_page.dart';
import 'package:cardapio/view/tela_cadastro.dart';
import 'package:cardapio/view/tela_esqueceu_senha.dart';

void main() {
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
      initialRoute: 'login', //Tela que o app inicia
      routes: {
        'login': (context) => LoginPage(
              onTap: () {},
            ), //Tela de login
        'cadastro': (context) => TelaCadastro(
              onTap: () {},
            ), //Tela de cadastro
        'esqueceu': (context) => TelaEsqueceuSenha(), //Tela de esqueceu a senha
      },
    );
  }
}
