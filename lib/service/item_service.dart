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
              8.00,
              'lib/images/Salgados/PãoDeQueijoMineiro.jpg'),
          Item(
              'Sanduíche Veggie Power',
              'Uma opção deliciosa é nutritiva! Feito com guacamole caseiro, rodelas de tomate, queijo vegano. Perfeito para quem busca uma alimentação mais saudável',
              16.00,
              'lib/images/Salgados/SanduicheVeggiePower.jpg'),
          Item(
              'Torta da Vovó',
              'Resgatando o sabor da casa da vovó, nossa torta é feito com uma receita especial, transmitida de geração em geração. Uma experiência culinária inesquecível!',
              16.00,
              'lib/images/Salgados/TortaDaVovó.jpg'),
          Item(
              'Bolo Salgado de Frango',
              'O prato mais pedido da casa! Saboreie essa deliciosa combinação de frango desfiado, legumes e molho cremoso em camadas de pão de forma com um toque de salsa picada.',
              25.00,
              'lib/images/Salgados/BoloSalgadoDeFrango.jpg'),
          Item(
              'Batata Jacu',
              'Sabores nordestinos em um prato único! A carne seca desfiada, o queijo coalho e os pedaços de bacon dão um toque especial a essa batata.',
              19.00,
              'lib/images/Salgados/BatataJacu.jpg')
        ],
      ),
      Categoria(
        'Doces',
        [
          Item(
              'Brownie Bites Gourmet',
              'Deliciosos pedaços de brownie úmido e intenso, feitos com chocolate belga e nozes crocantes. Perfeitos para adoçar qualquer momento e te levar para o paraíso do chocolate.\n\nContém: 8 brownies pequenos',
              25.00,
              'lib/images/Doces/BrownieBitesGourmet.jpg'),
          Item(
              'Cheesecake de Mirtilo',
              'Um clássico. Base crocante e recheio cremoso de queijo, finalizado com uma generosa camada de mirtilos frescos.',
              20.0,
              'lib/images/Doces/CheesecakeDeMirtilo.jpg'),
          Item(
              'Pistachio Dream',
              'Uma explosão de sabor em cada garfada! Cheesecake cremoso com um toque de limão siciliano, coberto por uma generosa camada de mousse de pistache e finalizado com pistaches triturados. Um verdadeiro deleite para os sentidos.',
              30.00,
              'lib/images/Doces/PistachioDream.jpg'),
          Item(
              'Azul Celeste',
              'Uma ode à natureza em cada garfada. Massa crocante e recheio cremoso com blueberries frescas, finalizado com um toque cítrico de limão siciliano. Uma experiência única para os paladares mais exigentes.',
              18.00,
              'lib/images/Doces/AzulCeleste.jpg'),
          Item(
              'Jardim Secreto',
              'Saboreie a natureza em cada garfada. Nossas tartes são preparadas com ingredientes frescos e naturais, como frutas da estação e flores comestíveis. Uma opção leve e nutritiva para um momento de puro prazer.\n\n Os sabores inclusos são: maracujá com capuchinha, morango com violetas e limão siciliano com calêndula.\n\nContém: 6 tortinhas variadas',
              75.00,
              'lib/images/Doces/JardimSecreto.jpg'),
          Item(
              'Eclair do Amor',
              'Uma explosão de sabor e amor em cada mordida. Nosso Eclair do Amor é feito com massa choux leve e crocante, recheado com um creme de chantilly suave e finalizado com morangos frescos em formato de coração. Perfeito para celebrar momentos especiais.',
              10.00,
              'lib/images/Doces/EclairDoAmor.jpg'),
          Item(
              'Mordida Mágica ',
              'Dê uma mordida e embarque em uma aventura deliciosa! Nosso Biscoito da Rainha de Copas é feito com ingredientes especiais, coberto com glacê branco e uma massa leve e macia proporcionando uma experiência única e mágica. Perfeito para quem busca um toque de fantasia no dia a dia.\n\nContém: 5 unidades',
              25.00,
              'lib/images/Doces/MordidaMágica.jpg')
        ],
      ),
      Categoria(
        'Bebidas',
        [
          Item(
              'Cappuccino Artesanal',
              'Saboreie a tradição mineira em cada gole. Nosso cappuccino artesanal é feito com grãos 100% arábica do Sul de Minas, leite cremoso e um toque de canela.',
              15.00,
              'lib/images/Bebidas/CappuccinoArtesanal.jpg'),
          Item(
              'Chocolate Quente Premium',
              'Uma explosão de sabor em cada colherada, preparado com chocolate belga e um toque de especiarias, ele é coberto por uma camada de chantilly e borda de chocolate. Uma experiência única para os paladares mais exigentes.',
              25.00,
              'lib/images/Bebidas/ChocolateQuentePremium.jpg'),
          Item(
              'Unicórnio Rosa',
              'Uma explosão de sabor e magia em cada gole! Nosso chocolate quente rosa é feito com chocolate branco cremoso, corado naturalmente e finalizado com chantilly, marshmallows coloridos e confeitos. Uma experiência inesquecível para os amantes do doce.',
              24.00,
              'lib/images/Bebidas/UnicornioRosa.jpg'),
          Item(
              'Milkshake de Doce de Leite',
              'Um clássico irresistível! Nosso milkshake combina a cremosidade do leite com a doçura intensa do caramelo, finalizado com chantilly e biscoitos amanteigados. Uma explosão de sabor em cada gole!',
              20.00,
              'lib/images/Bebidas/MilkshakeDeDoceDeLeite.jpg')
        ],
      )
    ];
    return list;
  }

  Item retornaItem(int catIndex, int itemIndex) {
    return list[catIndex].lista_itens[itemIndex];
  }
}
