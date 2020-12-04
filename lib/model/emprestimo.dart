class Emprestimo {
  String id;
  String idUser;
  String idLivro;
  String dataInicio;
  String dataFim;

  Emprestimo(
      {this.id, this.idUser, this.idLivro, this.dataInicio, this.dataFim});

  Emprestimo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUser = json['id_user'];
    idLivro = json['id_livro'];
    dataInicio = json['data_inicio'];
    dataFim = json['data_fim'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_user'] = this.idUser;
    data['id_livro'] = this.idLivro;
    data['data_inicio'] = this.dataInicio;
    data['data_fim'] = this.dataFim;
    return data;
  }
}