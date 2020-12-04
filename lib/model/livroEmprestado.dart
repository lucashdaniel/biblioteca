class LivroEmprestado {
  String nome;
  String autor;
  String editora;
  String dataInicio;
  String dataFim;

  LivroEmprestado(
      {this.nome, this.autor, this.editora, this.dataInicio, this.dataFim});

  LivroEmprestado.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    autor = json['autor'];
    editora = json['editora'];
    dataInicio = json['data_inicio'];
    dataFim = json['data_fim'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['autor'] = this.autor;
    data['editora'] = this.editora;
    data['data_inicio'] = this.dataInicio;
    data['data_fim'] = this.dataFim;
    return data;
  }
}