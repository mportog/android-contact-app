import 'dart:ui';

import 'package:contactsflutter/form.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Contatos',
      color: Colors.white,
      home: MyHomePage(),
      theme: ThemeData(fontFamily: 'Roboto-Thin'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Contatos',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Exemplo de layout contatos do Android',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormContact();
              },
            ),
          );
        },
        tooltip: 'Novo Contato',
        child: Icon(Icons.add),
      ),
    );
  }
}
