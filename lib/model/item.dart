class Item {
  //ATRIBUTOS
  //imagem?
  final String nome;
  final String descricao;
  final double preco;
  int quantidade;

  Item(
      //CONSTRUTOR
      this.nome,
      this.descricao,
      this.preco,
      {this.quantidade = 1});
}
