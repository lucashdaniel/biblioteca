class Livro {
  String id;
  String nome;
  String editora;
  String edicao;
  String autor;
  String emprestimo;

  Livro(
      {this.id,
        this.nome,
        this.editora,
        this.edicao,
        this.autor,
        this.emprestimo});

  Livro.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    editora = json['editora'];
    edicao = json['edicao'];
    autor = json['autor'];
    emprestimo = json['emprestimo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['editora'] = this.editora;
    data['edicao'] = this.edicao;
    data['autor'] = this.autor;
    data['emprestimo'] = this.emprestimo;
    return data;
  }
}