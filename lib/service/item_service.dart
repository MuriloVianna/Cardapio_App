import '../model/categoria.dart';
import '../model/item.dart';

class ItemService {
  List<Categoria> list = [];

  List<Categoria> gerarMenu() {
    list = [
      Categoria(
        'Salgados',
        [
          Item(
              'Pão de Queijo Mineiro',
              'Perfeitos para acompanhar um café coado na hora. Nosso pão de queijo mineiro, com sua casquinha com sua casquinha crocante e interior macio e cremoso, é uma explosão de sabor em sua boca!\n\nContém: 10 mini pães de queijo',
              8.00),
          Item(
              'Sanduíche Veggie Power',
              'Uma opção deliciosa é nutritiva! Feito com guacamole caseiro, rodelas de tomate, queijo vegano. Perfeito para quem busca uma alimentação mais saudável',
              16.00)
        ],
      ),
      Categoria(
        'Doces',
        [
          Item(
              'Brownie Bites Gourmet',
              'Deliciosos pedaços de brownie úmido e intenso, feitos com chocolate belga e nozes crocantes. Perfeitos para adoçar qualquer momento e te levar para o paraíso do chocolate.\n\nContém: 8 brownies pequenos',
              25.00),
          Item(
              'Cheesecake de Mirtilo',
              'Um clássico. Base crocante e recheio cremoso de queijo, finalizado com uma generosa camada de mirtilos frescos.',
              20.00)
        ],
      ),
    ];
    return list;
  }

  Item retornaItem(int catIndex, int itemIndex) {
    return list[catIndex].lista_itens[itemIndex];
  }
}
