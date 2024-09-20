import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      //Sombra ao fundo do botão
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Colors.black, Colors.black12],
        begin: Alignment.bottomCenter,
        end: Alignment.center,
      ).createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'lib/images/cafeteria.jpg'), //Imagem de fundo da Tela de Login
            fit: BoxFit.cover, //Ajusta a imagem para cobrir todo o container
            colorFilter: ColorFilter.mode(
                Colors.black45,
                BlendMode
                    .darken), //Filtro de cor escuro para deixar a imagem ao fundo e não atrapalhar a leitura do que esta na tela
          ),
        ),
      ),
    );
  }
}
