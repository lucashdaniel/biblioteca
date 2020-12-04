import 'package:biblioteca/model/emprestimo.dart';
import 'package:biblioteca/service/api.dart';
import 'package:flutter/material.dart';



class EmprestimoLivro extends StatefulWidget {
  @override
  _EmprestimoLivroState createState() => _EmprestimoLivroState();
}

class _EmprestimoLivroState extends State<EmprestimoLivro> {

  RestApi restApi = new RestApi();
  Emprestimo emprestimo;

  final textControllerCodigoLivro = TextEditingController();
  final textControllerCodigoAluno = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text("Emprestar Livro"),
      ),
      body: Form(
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
                  buttonColor: Colors.green,
                  child: RaisedButton(
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    onPressed: (){
                      EmprestaLivro();
                    },
                    child: Text("Emprestar Livro"),
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
    emprestimo = await restApi.EmprestimoLivro(textControllerCodigoLivro.text, textControllerCodigoAluno.text);


  }
}
