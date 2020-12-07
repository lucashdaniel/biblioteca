
import 'package:biblioteca/telas/login.dart';
import 'package:biblioteca/telas/tela_aluno.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.orange,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(),
      navigatorKey: navigatorKey,
    );
  }
}

