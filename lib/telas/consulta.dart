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
          title: Text("Consulta de Livros",
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.black,
          ),
          ),
          backgroundColor: Colors.orange,
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
        margin: EdgeInsets.all(10),
        color: Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset('assets/book.png'),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nome :" + livro.nome,
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Autor :" + livro.autor,
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Editora :" + livro.editora,
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,),
                    ),
                    Text(
                      "Edição :" + livro.edicao,
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,),
                    ),


                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}
