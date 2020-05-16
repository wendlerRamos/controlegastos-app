import 'package:controlegastos/screens/auth/login.dart';
import 'package:flutter/material.dart';
//import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.blue[900],
      home: LoginScreen(),
    );
  }
}