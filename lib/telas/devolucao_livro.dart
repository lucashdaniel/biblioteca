import 'package:biblioteca/service/api.dart';
import 'package:flutter/material.dart';


class DevolucaoLivro extends StatefulWidget {
  @override
  _DevolucaoLivroState createState() => _DevolucaoLivroState();
}

class _DevolucaoLivroState extends State<DevolucaoLivro> {

  final textControllerDevolveLivro = TextEditingController();

  RestApi api = RestApi();
  DevolucaoLivro devolucaoLivro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text("Devolver Livro"),
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
                      controller: textControllerDevolveLivro,
                    ),
                  ),
                  ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width*0.60,
                    buttonColor: Colors.green,
                    child: RaisedButton(
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      onPressed: (){
                        DevolveLivro();
                      },
                      child: Text("Devolver Livro"),
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
    devolucaoLivro = await api.DevolucaoLivroLivro(textControllerDevolveLivro.text);

  }

}
