class User {
  String id;
  String nome;
  String user;
  String senha;
  String tipo;

  User({this.id, this.nome, this.user, this.senha, this.tipo});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    user = json['user'];
    senha = json['senha'];
    tipo = json['tipo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['user'] = this.user;
    data['senha'] = this.senha;
    data['tipo'] = this.tipo;
    return data;
  }
}