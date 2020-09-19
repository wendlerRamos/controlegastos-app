import 'package:controlegastos/controllers/util.dart';
import 'package:controlegastos/controllers/routes.dart';
import 'package:controlegastos/navigation_screen.dart';
import 'package:controlegastos/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getThemeColors();
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      darkTheme: ThemeData.dark(),
      supportedLocales: [const Locale('pt', 'BR')],
      title: "CONTROLE DE GASTOS",
      theme: ThemeData(
        primaryColor: Color.fromARGB(
          255,
          3,
          40,
          80,
        ),
      ),
      color: Color.fromARGB(
        255,
        3,
        40,
        80,
      ),
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
        navigateAfterSeconds: CheckAuth(),
        loaderColor: Colors.white,
        loadingText: Text(
          'CONTROLE DE GASTOS',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Center(
        child: Container(
          width: 150.0,
          child: Icon(
            Icons.monetization_on,
            size: 120.0,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      var tokenIsValid = await checkIfTokenIsValid();
      if (tokenIsValid) {
        setState(() {
          isAuth = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = NavigationScreen();
    } else {
      child = LoginScreen();
    }
    return Scaffold(
      body: child,
    );
  }
}
