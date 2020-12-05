import 'package:biblioteca/model/livroEmprestado.dart';
import 'package:biblioteca/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:biblioteca/model/Livro.dart';
import 'package:biblioteca/service/api.dart';

class TelaAluno extends StatelessWidget {

  RestApi rest = new RestApi();
  List<LivroEmprestado> livrosEmprestado;


  final User user;

  TelaAluno({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Tela Aluno'),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: CarregaLivroEmprestado(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Text("Não Encontrado");
                    case ConnectionState.waiting :
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    default:
                      return Column(
                        children: [
                          Text("Livro(s) em empréstimo: "),
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.all(10.0),
                              itemCount: livrosEmprestado.length,
                              itemBuilder: (context, index) {
                                return CardLivro(livrosEmprestado[index]);
                              },
                            ),
                          )
                        ],
                      );
                  }
                },
              ),
            ),
          ],
        )

    );
  }

  CarregaLivroEmprestado() async {
    livrosEmprestado = await rest.LivrosEmprestadosPorAluno(user.id);
  }


  Widget CardLivro(LivroEmprestado livro) {
    var parsedDate = DateTime.parse(livro.dataFim);
    var now = DateTime.now();
    Color color;
    if(parsedDate.isBefore(now)){
      color = Colors.redAccent;
    } else if(parsedDate.isAfter(now)){
      color = Colors.green;
    } else {
      color = Colors.yellowAccent;
    }
    return Card(
      color: color,
      child: Row(
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Text(
                "nome: " + livro.nome,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "Editora: " + livro.editora,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "Autor: " + livro.autor,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "Data Inicio : " + livro.dataInicio,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "Data Fim :" + livro.dataFim,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),

            ],
          )
        ],
      ),
    );
  }
}


