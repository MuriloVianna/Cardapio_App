import 'package:flutter/material.dart';
import '../estilos.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: Text(
          "Ana's Coffee",
          style: logo.copyWith(fontSize: 40),
        ),
      ),
      backgroundColor: cor4,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pushNamed(
              context, 'login'); // Função para voltar para a tela anterior
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // Tamanho padrão
}
