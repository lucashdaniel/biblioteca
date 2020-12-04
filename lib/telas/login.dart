import 'package:biblioteca/model/user.dart';
import 'package:biblioteca/service/api.dart';
import 'package:biblioteca/telas/tela_aluno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final textControllerLogin = TextEditingController();
  final textControllerSenha = TextEditingController();

  RestApi api = RestApi();
  User user;




  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Form(
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(25),
                  child: Image(
                    image: AssetImage('assets/biblioteca.png'),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Login',
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                    ),
                    controller: textControllerLogin,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Senha',
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                    ),
                    controller: textControllerSenha,
                  ),
                ),
                ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width*0.60,
                  buttonColor: Colors.deepPurple,
                  child: RaisedButton(
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    onPressed: (){
                      CarregaLogin();
                    },
                    child: Text('Acessar'),
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }

  CarregaLogin() async {
    print("Entrei no carrega Login");
    user = await api.Login(textControllerLogin.text, textControllerSenha.text);
    if (user.tipo == "0") {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Home()),
      );
    }else if(user.tipo == "1"){
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TelaAluno(user: user,)),
      );
    }
    else{
      _showDialog("Verificar Login e senha !", 1);
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

  void _telaAluno(BuildContext context) {
    int id = textControllerLogin.text.length;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TelaAluno(user: user),
        ));
  }
}













