import 'package:biblioteca/model/Livro.dart';
import 'package:biblioteca/service/api.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class CadastroLivro extends StatefulWidget {
  @override
  _CadastroLivroState createState() => _CadastroLivroState();
}

class _CadastroLivroState extends State<CadastroLivro> {

  final _limpaCampo = GlobalKey<FormState>();
  final textControllerNome = TextEditingController();
  final textControllerEditora = TextEditingController();
  final textControllerEdicao = TextEditingController();
  final textControllerAutor = TextEditingController();

  RestApi api = RestApi();
  Livro livro;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        title: const Text('Cadastro de Livros',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.black,
        ),
        ),
      ),

      body: Form(
        key: _limpaCampo,
          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.book),
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'Digite o Nome do Livro',
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                      ),
                      controller: textControllerNome,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.my_library_books_rounded),
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'Digite a Editora do Livro',
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                      ),
                      controller: textControllerEditora,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.book_online_rounded),
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'Digite a Edição do Livro',
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                      ),
                      controller: textControllerEdicao,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'Digite o Autor do Livro',
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                      ),
                      controller: textControllerAutor,
                    ),
                  ),
                  ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width*0.60,
                    buttonColor: Colors.black54,
                    child: RaisedButton(
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      onPressed: (){
                        CadastroLivro();
                        Navigator.of(context)
                            .push(MaterialPageRoute(
                          builder: (BuildContext context) => Home(),
                        ))
                            .then((_) => _limpaCampo.currentState.reset());

                      },
                      textColor: Colors.white,
                      child: Text('Cadastrar', style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),),
                      
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }

  CadastroLivro() async {
    livro = await api.CadastroLivro(textControllerNome.text, textControllerEdicao.text, textControllerEdicao.text, textControllerAutor.text);
    _showDialog("Livro cadastrado com sucesso!!!", 0);

  }

  void _showDialog(String s, int i) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(s),
          actions: <Widget>[
            FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                if(i == 0) {
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

}
