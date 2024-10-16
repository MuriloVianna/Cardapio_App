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

  // Regex para validar o formato do email
  final String emailPattern = r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+';

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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '    O campo de email não pode estar vazio';
          } else if (!RegExp(emailPattern).hasMatch(value)) {
            return '    Digite um email válido';
          }
          return null;
        },
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '    O campo de senha não pode estar vazio';
          } else if (value.length < 6) {
            return '    A senha deve ter pelo menos 6 caracteres';
          }
          return null;
        },
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

class ConfirmaSenhaText extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController senhaController;
  final bool obscureText;
  final String hintText;

  const ConfirmaSenhaText({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.hintText,
    required this.senhaController,
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '    O campo de senha não pode estar vazio';
          } else if (value != senhaController.text) {
            return '    As senhas não correspondem';
          }
          return null;
        },
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '    O campo de email não pode estar vazio';
          }
          return null;
        },
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
