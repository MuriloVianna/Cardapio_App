class Item {
  //ATRIBUTOS
  final String nome;
  final String descricao;
  final double preco;
  int quantidade;
  final String imagem;

  Item(
      //CONSTRUTOR
      this.nome,
      this.descricao,
      this.preco,
      this.imagem,
      {this.quantidade = 1,});
}
