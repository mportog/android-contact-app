import 'dart:ui';

import 'package:contactsflutter/form.dart';
import 'package:contactsflutter/splash.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Contatos',
      color: Colors.white,
      home: SplashScreen(),
      theme: ThemeData(
        fontFamily: 'Roboto-Thin'
      )      ,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[],
        centerTitle: true,
        title: Text(widget.title,
         style: TextStyle(color: Colors.black54, ),),
        backgroundColor: Colors.white,

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Exemplo de layout add contatos do Google',
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
