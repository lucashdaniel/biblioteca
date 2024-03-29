import 'package:biblioteca/model/Livro.dart';
import 'package:biblioteca/model/emprestimo.dart';
import 'package:biblioteca/service/api.dart';
import 'package:flutter/material.dart';

import 'home.dart';



class EmprestimoLivro extends StatefulWidget {
  @override
  _EmprestimoLivroState createState() => _EmprestimoLivroState();
}

class _EmprestimoLivroState extends State<EmprestimoLivro> {

  RestApi restApi = new RestApi();
  Emprestimo emprestimo;
  Livro livro;

  final _limpaCampo = GlobalKey<FormState>();
  final textControllerCodigoLivro = TextEditingController();
  final textControllerCodigoAluno = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text("Emprestar Livro",
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.black
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
                    controller: textControllerCodigoLivro,
                  ),
               ),
                Padding(padding: EdgeInsets.all(10),
                  child:  TextFormField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                        hintText: "Digite o Código do Aluno"
                    ),
                    controller: textControllerCodigoAluno,
                  ),
                ),
                ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width*0.60,
                  buttonColor: Colors.black54,
                  child: RaisedButton(
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    onPressed: (){
                      EmprestaLivro();
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                        builder: (BuildContext context) => Home(),
                      ))
                          .then((_) => _limpaCampo.currentState.reset());

                    },
                    child: Text("Emprestar Livro", style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),),
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }

  EmprestaLivro()async{
    livro = await restApi.LivroPorId(textControllerCodigoLivro.text);
    if(livro.nome == null){
      _showDialog('Código inválido favor verificar', 0);
    }
    if(livro.emprestimo == "1"){
      _showDialog("Esse livro já está emprestado você não pode empresta-lo", 0);
    } else {
      emprestimo = await restApi.EmprestimoLivro(
          textControllerCodigoLivro.text, textControllerCodigoAluno.text);
      _showDialog('Emprestimo do livro ' + livro.nome + " efetuado com sucesso!", 1);
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
              child: new Text("Ok", style: TextStyle(fontSize: 22.0, color: Colors.black)),
              onPressed: () {
                if(i == 0) {
                  Navigator.of(context).pop();
                }
                if(i == 1){
                  Navigator.of(context).pop();
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
