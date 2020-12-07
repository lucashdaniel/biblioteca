
import 'dart:convert';
import 'package:biblioteca/model/Livro.dart';
import 'package:biblioteca/model/emprestimo.dart';
import 'package:biblioteca/model/livroEmprestado.dart';
import 'package:biblioteca/model/user.dart';
import 'package:biblioteca/telas/cadastro_livro.dart';
import 'package:biblioteca/telas/devolucao_livro.dart';
import 'package:biblioteca/telas/emprestimo_livro.dart';
import 'package:biblioteca/telas/tela_aluno.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


class RestApi {
  static final CADASTRO_URL = "http://192.168.0.103/cadastraLivro.php";

  Future<Livro> CadastroLivro(String nome, String editora, String edicao,
      String autor) async {
    http.Response response = await http.post(CADASTRO_URL, body: {
      "nome": nome,
      "editora": editora,
      "edicao": edicao,
      "autor": autor
    });
    print(response.body);
    if (response.body[0] == "[") {
      var jsonData = convert.json.decode(response.body);
      print(jsonData.toString());
      return Livro.fromJson(convert.json.decode(response.body));
    } else {
      return new Livro();
    }
  }


  static final EMPRESTIMO_URL = "http://192.168.0.103/fazEmprestimo.php";

  Future<Emprestimo> EmprestimoLivro(String codigoLivro,
      String codigoAluno) async {
    String date = DateFormat("yyyy-MM-dd").format(DateTime.now());
    String dataDevolucao = DateFormat("yyyy-MM-dd").format(
        DateTime.now().add(new Duration(days: 7)));

    http.Response response = await http.post(EMPRESTIMO_URL, body: {
      "livro_id": codigoLivro,
      "user_id": codigoAluno,
      "data_inicio": date,
      "data_fim": dataDevolucao
    });
    print(response.body);
    if (response.body[0] == "[") {
      var jsonData = convert.json.decode(response.body);
      print(jsonData.toString());
      return Emprestimo.fromJson(convert.json.decode(response.body));
    } else {
      return new Emprestimo();
    }
  }


  static final BUSCALIVROEMPRESTADO_URL = "http://192.168.68.113/buscaIdLivro.php";




  static final CARREGALIVROEMPRESTADO_URL = "http://192.168.0.103/emprestadoPorUser.php";

  Future<List<LivroEmprestado>> LivrosEmprestadosPorAluno(String codigoAluno) async {
    print(codigoAluno);
    http.Response response = await http.post(CARREGALIVROEMPRESTADO_URL, body: {
      "id_user": codigoAluno,
    });
    print(response.body);
    List<LivroEmprestado> livros = [];
    var jsonData = json.decode(response.body);
    print(jsonData);

    for (var l in jsonData) {
      livros.add(new LivroEmprestado.fromJson(l));
    }
    print(livros.toString());

    return livros;
  }



    static final DEVOLUCAO_URL = "http://192.168.0.103/devolucao.php";

  Future<DevolucaoLivro> DevolucaoLivroLivro(String codigoLivro)async {
    String date = DateFormat("yyyy-MM-dd").format(DateTime.now());
    String dataDevolucao = DateFormat("yyyy-MM-dd").format(
        DateTime.now().add(new Duration(days: 7)));

    http.Response response = await http.post(DEVOLUCAO_URL, body: {
      "livro_id": codigoLivro,

    });
  }


  static final GETLIVRO_URL = "http://192.168.0.103/getLivros.php";

  Future<List<Livro>> getAllLivros()async{
    var data = await http.get("http://192.168.0.103/getLivros.php");

    var jsonData = json.decode(data.body);

    List<Livro> livros = [];

    for(var l in jsonData){
      livros.add(new Livro.fromJson(l));
    }
    print(livros.toString());

    return livros;
  }

  static final LOGIN_URL = "http://192.168.0.103/login.php";

  Future<User> Login(String login, String Senha) async {
    print(login);
    print(Senha);
    http.Response response = await http.post(LOGIN_URL, body: {

      "user": login,
      "senha": Senha,
    });
    print(response.body[0]);
    if (response.body[0] == "{"){
      var jsonData = convert.json.decode(response.body);
      print(jsonData.toString());
      return  User.fromJson(convert.json.decode(response.body));
    } else{
      return new User();
    }

  }

  static final LIVRO_POR_ID = "http://192.168.0.103/buscaIdLivro.php";

  Future<Livro> LivroPorId(String codigoLivro) async{
    http.Response response = await http.post(LIVRO_POR_ID, body: {
      "livro_id": codigoLivro,
    });
    if(response.body[0] == "<"){
      return new Livro();
    }
    var jsonData = convert.json.decode(response.body);
    if (response.body[0] == "{"){
      var jsonData = convert.json.decode(response.body);
      return  Livro.fromJson(convert.json.decode(response.body));
    }else{
      return new Livro();
    }

  }

}


