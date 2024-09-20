import 'package:cardapio/estilos.dart';
import 'package:flutter/material.dart';
import '../Widget/widget.dart';

class TelaEsqueceuSenha extends StatelessWidget {
  const TelaEsqueceuSenha({super.key});

  @override
  Widget build(BuildContext context) {
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
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12), // Espaço entre as duas caixas
                            //
                            //               Caixa do Email
                            //

                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[600]?.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical:
                                          20), // Deixa o conteudo do textField alinhado simetricamente
                                  border: InputBorder.none,
                                  hintText: 'Email',
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            20), // Deixa o conteudo do textField alinhado simetricamente
                                    child: Icon(Icons.mail, //Icone do email
                                        size: 30,
                                        color: Colors.white),
                                  ),
                                  hintStyle:
                                      textoLogin, // Propriedades do texto de email na classe paletas
                                ),
                                style: textoLogin,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 100,
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
