import 'package:cardapio/estilos.dart';
import 'package:flutter/material.dart';

class BotaoLogin extends StatelessWidget {
  final String text;
  final ButtonStyle? style;
  final Function()? onTap;

  const BotaoLogin({super.key, required this.text, this.onTap, this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: style,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Text(
            text,
            style: textoLogin,
          ),
        ),
      ),
    );
  }
}

class BotaoCadatro extends StatelessWidget {
  final String text;
  final ButtonStyle? style;
  final Function()? onTap;

  const BotaoCadatro({super.key, required this.text, this.style, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: OutlinedButton(
        onPressed: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Text(
            text,
            style: textoLogin,
          ),
        ),
      ),
    );
  }
}
