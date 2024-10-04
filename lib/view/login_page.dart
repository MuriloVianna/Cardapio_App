import 'package:cardapio/estilos.dart';
import 'package:flutter/material.dart';
import '../Widget/widget.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// Chave global para o formulário
final _formKey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController senhaController = TextEditingController();
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
              // icone do app
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
              // texto do restaurante
              SizedBox(
                height: 50,
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
                          key: _formKey,
                          // Associa a chave do formulário para validação
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .end, // Deixa o botão "esqueceu a senha" na direita
                            children: [
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
                              //
                              // Botao esqueceu a senha
                              //
                              TextButton(
                                child: Text(
                                  'Esqueceu a senha?',
                                  style: textoLogin.copyWith(
                                    color: cor1,
                                  ),
                                ),
                                onPressed: () {
                                  _formKey.currentState!.reset();
                                  Navigator.pushNamed(context, 'esqueceu');
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 80,
                          ),
                          // Botao Login
                          BotaoLogin(
                            text: 'Login',
                            style:
                                ElevatedButton.styleFrom(backgroundColor: cor5),
                            onTap: () {
                              // Verifica se o formulário é válido
                              if (_formKey.currentState!.validate()) {
                                // Se válido, faz alguma ação (envia os dados, etc.)
                                _formKey.currentState!.reset();
                                Navigator.pushNamed(context, 't2');
                              }
                              ;
                            },
                          ),
                          //
                          SizedBox(
                            height: 20,
                          ),
                          //
                          BotaoCadatro(
                            text: 'Cadastre-se!',
                            onTap: () {
                              _formKey.currentState!.reset();
                              Navigator.pushNamed(context, 'cadastro');
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
      ],
    );
  }
}
