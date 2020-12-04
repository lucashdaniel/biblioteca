import 'package:biblioteca/model/Livro.dart';
import 'package:biblioteca/service/api.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class CadastroLivro extends StatefulWidget {
  @override
  _CadastroLivroState createState() => _CadastroLivroState();
}

class _CadastroLivroState extends State<CadastroLivro> {

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
        backgroundColor: Colors.deepPurple,
        title: const Text('Cadastro de Livros'),
      ),

      body: Form(
          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'Nome',
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.zero,)
                        ),
                      ),
                      controller: textControllerNome,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'Editora',
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.zero)
                        ),
                      ),
                      controller: textControllerEditora,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'Edição',
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.zero)
                        ),
                      ),
                      controller: textControllerEdicao,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'Autor',
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.zero)
                        ),
                      ),
                      controller: textControllerAutor,
                    ),
                  ),
                  ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width*0.60,
                    buttonColor: Colors.deepPurple,
                    child: RaisedButton(
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                      onPressed: (){
                        CadastroLivro();
                      },
                      child: Text('Cadastrar'),
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
    print(livro);

  }



}
