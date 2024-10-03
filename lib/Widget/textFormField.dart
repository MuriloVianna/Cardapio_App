import 'package:cardapio/estilos.dart';
import 'package:flutter/material.dart';

class Textformfield extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;

  const Textformfield({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[600]?.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal:
                20), // Cria um espaço na lateral para a caixa não ficar colada no canto
        child: TextFormField(
          controller: controller, // controla o texto inserido
          obscureText:
              obscureText, // controla se e possivel ver oq esta sendo digitado
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[600]!.withOpacity(0.8),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: cor2),
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: cor1),
          ),
        ),
      ),
    );
  }
}

class EmailText extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;

  const EmailText({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[600]?.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextFormField(
        controller: controller, // controla o texto inserido
        obscureText:
            obscureText, // controla se e possivel ver oq esta sendo digitado
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical:
                  20), // Deixa o conteudo do textField alinhado simetricamente
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(
                horizontal:
                    20), // Deixa o conteudo do textField alinhado simetricamente
            child: Icon(Icons.mail, //Icone do email
                size: 30,
                color: Colors.white),
          ),
          hintText: hintText,
          hintStyle:
              textoLogin, // Propriedades do texto de email na classe paletas
        ),
        style: textoLogin,
        keyboardType: TextInputType
            .emailAddress, // Teclado otimizado para e-mail e validação semantica
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

class SenhaText extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;

  const SenhaText({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[600]?.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextFormField(
        controller: controller, // controla o texto inserido
        obscureText:
            obscureText, // controla se e possivel ver oq esta sendo digitado
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical:
                  20), // Deixa o conteudo do textField alinhado simetricamente
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(
                horizontal:
                    20), // Deixa o conteudo do textField alinhado simetricamente
            child: Icon(Icons.lock, //Icone do email
                size: 30,
                color: Colors.white),
          ),
          hintText: hintText,
          hintStyle:
              textoLogin, // Propriedades do texto de email na classe paletas
        ),
        style: textoLogin,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

class NomeText extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const NomeText({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[600]?.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextFormField(
        controller: controller, // controla o texto inserido
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical:
                  20), // Deixa o conteudo do textField alinhado simetricamente
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(
                horizontal:
                    20), // Deixa o conteudo do textField alinhado simetricamente
            child: Icon(Icons.person, //Icone do email
                size: 30,
                color: Colors.white),
          ),
          hintText: hintText,
          hintStyle:
              textoLogin, // Propriedades do texto de email na classe paletas
        ),
        style: textoLogin,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
