import 'package:cardapio/estilos.dart';
import 'package:flutter/material.dart';
import '../../Widget/widget.dart';

class TelaEsqueceuSenha extends StatefulWidget {
  final void Function()? onTap;

  const TelaEsqueceuSenha({super.key, this.onTap});

  @override
  State<TelaEsqueceuSenha> createState() => _TelaEsqueceuSenhaState();
}

// Chave global para o formulário
final formKey = GlobalKey<FormState>();

class _TelaEsqueceuSenhaState extends State<TelaEsqueceuSenha> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return Stack(
      children: [
        BackgroundImage(), //Retorna a imagem de fundo
        Scaffold(
          backgroundColor: Colors
              .transparent, //Cor transparente para não tampar a imagem ao fundo
          body: SafeArea(
            //Deixa a logo em uma posição que não tampa nada
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 200,
                  child: Center(
                    child: Text(
                      " Ana's\nCoffee",
                      style:
                          logo, //Propriedades da logo definada na classe paletas
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal:
                          7), // Cria um espaço na lateral para a caixa não ficar colada no canto
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Esqueceu a senha?',
                                style: textoLogin.copyWith(fontSize: 35),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                'Insira um email de recuperação',
                                style: textoLogin.copyWith(fontSize: 15),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              EmailText(
                                  controller: emailController,
                                  obscureText: false,
                                  hintText: 'Email de recuperação'),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 160,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text(
                                        'Email enviado com sucesso!'),
                                    content: const Text(
                                        'Verifique seu email para recuperar a sua senha'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pushNamed(
                                            context, 'login'),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: cor5),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Text(
                                  'Enviar',
                                  style: textoLogin,
                                ),
                              ),
                            ),
                          ),
                          //
                          SizedBox(height: 20),
                          //
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'login');
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Text(
                                  'Voltar',
                                  style: textoLogin,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
