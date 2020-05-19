import 'package:controlegastos/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
//import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Color _colorBlue = Color.fromARGB(255, 3, 40, 80);
  Color _colorLightBlue = Color.fromARGB(255, 8, 74, 146);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Controle de Gastos",
      theme: ThemeData(
        primaryColor: _colorBlue,
      ),
      color: _colorBlue,
      home: _introScreen(),
    );
  }
}

Widget _introScreen() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 5,
        gradientBackground: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color.fromARGB(255, 3, 40, 80), 
            Color.fromARGB(255, 8, 74, 180)
          ],
        ),
        navigateAfterSeconds: LoginScreen(),
        loaderColor: Colors.white,
        loadingText: Text('CONTROLE DE GASTOS', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),),
      ),
      Center(
        child:Container(
            width: 150.0,
            child: Icon(Icons.monetization_on, size: 120.0, color: Colors.white,),
            /*
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/icon-152x152.png"),
                fit: BoxFit.none,
              ),
            ),
            */
          ),
      ),
      /*Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text("Some Ramdom text here", style: TextStyle(color: Colors.white),),
          ),
      ),*/
    ],
  );
}