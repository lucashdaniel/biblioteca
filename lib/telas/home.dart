
import 'package:flutter/material.dart';

import 'cadastro_livro.dart';
import 'consulta.dart';
import 'devolucao_livro.dart';
import 'emprestimo_livro.dart';
import 'inicio_btn.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

/// This is the private State class that goes with MyStatefulWidget.
class _Home extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    InicioBTN(),
    CadastroLivro(),
    getAllLivros(),
    EmprestimoLivro(),
    DevolucaoLivro(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Gerenciador de tarefas'),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type : BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_align_left_rounded,size: 30),
            label: 'Cadastrar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded,size: 30),
            label: 'Consultar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_turned_in_rounded,size: 30),
            label: 'Emprestar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_return_rounded,size: 30),
            label: 'Devolução',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orangeAccent,
        onTap: _onItemTapped,
      ),
    );

  }
}


