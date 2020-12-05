import 'package:biblioteca/model/Livro.dart';
import 'package:biblioteca/service/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class getAllLivros extends StatefulWidget {
  @override
  _getAllLivrosState createState() => _getAllLivrosState();
}

class _getAllLivrosState extends State<getAllLivros> {
  RestApi rest = new RestApi();
  List<Livro> todosOsLivros;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Consulta de Livros"),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: CarregarLivro(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Text("Não conectado");
                    case ConnectionState.waiting:
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    default:
                      return Column(
                        children: [
                          Expanded(
                              child: ListView.builder(
                                padding: EdgeInsets.all(10.0),
                                itemCount: todosOsLivros.length,
                                itemBuilder: (context, index) {
                                  return CardLivro(todosOsLivros[index]);
                                },
                              ))
                        ],
                      );
                  }
                },
              ),
            )
          ],
        ));
  }

  CarregarLivro() async {
    todosOsLivros = await rest.getAllLivros();
  }

  Widget CardLivro(Livro livro) {
    return Card(
      color: Colors.deepPurpleAccent,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: Icon(Icons.book, size: 50,),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
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
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}
