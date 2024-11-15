import 'package:cardapio/controller/login_controller.dart';
import 'package:cardapio/estilos.dart';
import 'package:flutter/material.dart';
import '../../Widget/widget.dart';

class TelaCadastro extends StatefulWidget {
  final void Function()? onTap;

  const TelaCadastro({super.key, required this.onTap});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

// Chave global para o formulário
final formKey = GlobalKey<FormState>();

class _TelaCadastroState extends State<TelaCadastro> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController senhaController = TextEditingController();
    TextEditingController ConfirmaSenhaController = TextEditingController();
    TextEditingController nomeController = TextEditingController();
    return Stack(
      children: [
        BackgroundImage(), //Retorna a imagem de fundo
        Scaffold(
          backgroundColor: Colors
              .transparent, //Cor transparente para não tampar a imagem ao fundo
          body: SingleChildScrollView(
            child: SafeArea(
                //Deixa a logo em uma posição que não tampa nada
                child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 150,
                  child: Center(
                    child: Text(
                      " Ana's\nCoffee",
                      style: logo.copyWith(
                        fontSize: 50,
                      ), //Propriedades da logo definada na classe paletas
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  child: Center(
                    child: Text(
                      " Vamos criar sua conta!",
                      style: textoLogin.copyWith(
                          fontSize:
                              30), //Propriedades da logo definada na classe estilos
                    ),
                  ),
                ),
                // texto do restaurante
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal:
                          7), // Cria um espaço na lateral para a caixa não ficar colada no canto
                  child: Column(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12), // Espaço entre as duas caixas
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .end, // Deixa o botão "esqueceu a senha" na direita
                              children: [
                                NomeText(
                                  controller: nomeController,
                                  hintText: 'Nome',
                                ),
                                SizedBox(
                                  height: 22,
                                ),
                                // Caixa do email
                                EmailText(
                                  controller: emailController,
                                  obscureText: false,
                                  hintText: 'Email',
                                ),
                                SizedBox(
                                  height: 22,
                                ),
                                //
                                // Caixa da senha
                                //
                                SenhaText(
                                  controller: senhaController,
                                  obscureText: true,
                                  hintText: 'Senha',
                                ),
                                SizedBox(
                                  height: 22,
                                ),
                                ConfirmaSenhaText(
                                  controller: ConfirmaSenhaController,
                                  senhaController: senhaController,
                                  obscureText: true,
                                  hintText: 'Confirme a Senha',
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            // Botao Login
                            BotaoLogin(
                              text: 'Criar conta',
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: cor5),
                              onTap: () {
                                // Verifica se o formulário é válido
                                if (formKey.currentState!.validate()) {
                                  LoginController().criarConta(
                                      context,
                                      nomeController.text,
                                      emailController.text,
                                      senhaController.text);
                                  // showDialog(
                                  //   context: context,
                                  //   builder: (BuildContext context) =>
                                  //       AlertDialog(
                                  //     title: const Text(
                                  //         'Conta criada com sucesso!'),
                                  //     content: const Text(
                                  //         'Faça o login agora mesmo para fazer os seus pedidos!'),
                                  //     actions: [
                                  //       TextButton(
                                  //         onPressed: () => Navigator.pushNamed(
                                  //             context, 'login'),
                                  //         child: const Text('OK'),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // );
                                  // formKey.currentState!.reset();
                                }
                              },
                            ),
                            //
                            SizedBox(
                              height: 20,
                            ),
                            //
                            BotaoCadatro(
                              text: 'Voltar',
                              onTap: () {
                                formKey.currentState!.reset();
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]),
                ),
              ],
            )),
          ),
        ),
      ],
    );
  }
}
