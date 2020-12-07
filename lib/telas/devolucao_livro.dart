import 'package:biblioteca/model/Livro.dart';
import 'package:biblioteca/service/api.dart';
import 'package:flutter/material.dart';

import 'home.dart';


class DevolucaoLivro extends StatefulWidget {
  @override
  _DevolucaoLivroState createState() => _DevolucaoLivroState();
}

class _DevolucaoLivroState extends State<DevolucaoLivro> {
  final _limpaCampo = GlobalKey<FormState>();
  final textControllerDevolveLivro = TextEditingController();

  RestApi api = RestApi();
  DevolucaoLivro devolucaoLivro;
  Livro livro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text("Devolver Livro",
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.black,
        ),
        ),
      ),
      body: Form(
        key: _limpaCampo,
          child: Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.all(10),
                    child:  TextFormField(
                      decoration: const InputDecoration(
                          icon: Icon(Icons.book),
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                          hintText: "Digite o Código do livro"
                      ),
                      controller: textControllerDevolveLivro,
                    ),
                  ),
                  ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width*0.60,
                    buttonColor: Colors.black54,
                    child: RaisedButton(
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      onPressed: (){
                        DevolveLivro();
                        Navigator.of(context)
                            .push(MaterialPageRoute(
                            builder: (BuildContext context) => Home(),
                        ))
                        .then((_) => _limpaCampo.currentState.reset());

                      },
                      child: Text("Devolver Livro", style:  TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                      ),


                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }

  DevolveLivro()async{
    livro = await api.LivroPorId(textControllerDevolveLivro.text);
    if(livro.nome == null){
      _showDialog('Código inválido favor verificar', 0);
    } else {
      devolucaoLivro = await api.DevolucaoLivroLivro(textControllerDevolveLivro.text);
      _showDialog('Livro devolvido com sucesso '+ livro.nome, 1);
    }


  }

  void _showDialog(String s, int i) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(s),
          actions: <Widget>[
            FlatButton(
              child: new Text("Ok", style: TextStyle(fontSize: 22.0, color: Colors.black),
              ),
              onPressed: () {
                if(i == 0) {
                  Navigator.of(context).pop();
                }
                if(i == 1){
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
