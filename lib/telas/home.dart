import 'package:biblioteca/telas/cadastro_livro.dart';
import 'package:biblioteca/telas/consulta.dart';
import 'package:biblioteca/telas/devolucao_livro.dart';
import 'package:biblioteca/telas/emprestimo_livro.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple[500],
        title: const Text('Gerenciador de Bibliotecas'),
      ),
          body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(padding: EdgeInsets.all(15.0),
                    child: ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width *0.60,
                      child: RaisedButton(
                          padding: EdgeInsets.all(20.0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CadastroLivro()
                              ),
                            );
                          },
                          child: Text("Cadastrar Livro",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                          ),
                          color: Colors.deepPurple[800]
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(15.0),
                    child: ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width *0.60,
                      child: RaisedButton(
                          padding: EdgeInsets.all(20.0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => getAllLivros()
                              ),
                            );;
                          },
                          child: Text("Consultar Todos os Livros",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                          ),
                          color: Colors.deepPurple[800]
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(15.0),
                    child: ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width *0.60,
                      child: RaisedButton(
                          padding: EdgeInsets.all(20.0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: Text("Emprestar Livro",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                          ),
                          color: Colors.deepPurple[800],
                          onPressed: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EmprestimoLivro()
                            ),
                          );;
                          }

                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(15.0),
                    child: ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width *0.60,
                      child: RaisedButton(
                          padding: EdgeInsets.all(20.0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DevolucaoLivro()
                              ),
                            );;
                          },
                          child: Text("Devolução",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                          ),
                          color: Colors.deepPurple[800]
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

        );


  }

}



