import 'package:flutter/material.dart';

class InicioBTN extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          centerTitle: true,
          title: Text('Página Administrador', style:
          TextStyle(
            fontSize: 25.0,
            color: Colors.black,
          )  ,
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
          image: DecorationImage(scale: 1,
            image: AssetImage('assets/biblioteca2.png'),
            fit: BoxFit.cover,
          )
          ),


        )
    );
  }
}

