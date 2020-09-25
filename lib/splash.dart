import 'package:contactsflutter/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashLoad();
  }

  void splashLoad() async {
    await Future.delayed(Duration(
      seconds: 3,
    ));
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MyHomePage(title: 'Contatos');
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
         height:MediaQuery.of(context).size.height,
         width:MediaQuery.of(context).size.width,
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: new AssetImage(
              'assets/splash2.png'),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.rectangle,
      ),
    );
    }
}
