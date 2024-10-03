import 'package:cardapio/estilos.dart';
import 'package:flutter/material.dart';
import '../Widget/widget.dart';

class TelaEsqueceuSenha extends StatelessWidget {
  const TelaEsqueceuSenha({super.key});

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
                //
                //
                //
                const SizedBox(
                  height: 50,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal:
                          7), // Cria um espaço na lateral para a caixa não ficar colada no canto
                  child: Column(
                    children: [
                      Column(
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
                      Column(
                        children: [
                          const SizedBox(
                            height: 180,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 147, 114, 56)),
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
                              onPressed: () {},
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
