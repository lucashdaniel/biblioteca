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

     final _scaffoldKey = GlobalKey<ScaffoldState>();
     final textControllerLogin = TextEditingController();
     final textControllerSenha = TextEditingController();

     RestApi api = RestApi();
     User user;

     @override
     void initState() {
       // TODO: implement initState
       super.initState();
     }


     @override
     Widget build(BuildContext context) {
       return Scaffold(
         key: _scaffoldKey,
         appBar: AppBar(
           title: Text("Login", style: TextStyle(
               fontSize: 25.0,
               color: Colors.black
           ),),
           centerTitle: true,
           backgroundColor: Colors.orangeAccent,
         ),
         body: Form(
             child: Container(

               alignment: Alignment.center,
               child: SingleChildScrollView(
                 child: Column(
                   children: [
                     Padding(padding: EdgeInsets.all(25),
                       child: Image(
                         image: AssetImage('assets/loginbiblioteca.png'),
                       ),
                     ),
                     Padding(padding: EdgeInsets.all(10),
                       child: TextFormField(
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 20.0,
                             color: Colors.black
                         ),
                         decoration: InputDecoration(
                           icon: Icon(Icons.person),
                           contentPadding: EdgeInsets.all(10),
                           hintText: 'Login',
                           border: OutlineInputBorder(
                               borderRadius: BorderRadius.all(Radius.circular(
                                   20))
                           ),
                         ),
                         controller: textControllerLogin,
                       ),
                     ),
                     Padding(padding: EdgeInsets.all(10),
                       child: TextFormField(
                         style: TextStyle(
                             color: Colors.black,
                             fontWeight: FontWeight.bold,
                             fontSize: 20.0
                         ),
                         obscureText: true,
                         decoration: InputDecoration(
                           icon: Icon(Icons.admin_panel_settings),
                           contentPadding: EdgeInsets.all(10),
                           hintText: 'Senha',
                           border: OutlineInputBorder(
                               borderRadius: BorderRadius.all(Radius.circular(
                                   20))
                           ),
                         ),
                         controller: textControllerSenha,
                       ),
                     ),
                     ButtonTheme(
                       minWidth: MediaQuery
                           .of(context)
                           .size
                           .width * 0.60,
                       buttonColor: Colors.black54,
                       child: RaisedButton(
                         padding: EdgeInsets.all(20),
                         shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(30)),
                         onPressed: () {
                           CarregaLogin();
                         },
                         child: Text('Acessar', style: TextStyle(
                             fontSize: 22.0,
                             color: Colors.white
                         ),
                         ),

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
       user =
       await api.Login(textControllerLogin.text, textControllerSenha.text);
       if (user.tipo == "0") {
         Navigator.push(
           context,
           MaterialPageRoute(
               builder: (context) => Home()),
         );
       } else if (user.tipo == "1") {
         Navigator.push(
           context,
           MaterialPageRoute(
               builder: (context) => TelaAluno(user: user,)),
         );
       }
       else {
         _scaffoldKey.currentState.showSnackBar(
             SnackBar(content: Text("Email ou senha incorretos"),
               backgroundColor: Colors.redAccent,
               duration: Duration(seconds: 2),
             )
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
   }












