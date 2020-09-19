import 'package:controlegastos/controllers/api.dart';
import 'package:controlegastos/controllers/util.dart';
import 'package:controlegastos/navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color _colorBlue = Color.fromARGB(255, 3, 40, 80);

  Color _colorLightBlue = Color.fromARGB(255, 8, 74, 146);

  Color _colorWhite = Colors.white;

  Color _colorOrange = Color.fromARGB(255, 255, 59, 0);

  bool isLoading = false;

  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  var usuario;
  var password;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _showMsg(msg) {
    final snackBar = SnackBar(
      backgroundColor: getColors(colorName: "soft_white"),
      content: Text(
        msg,
        style: TextStyle(
          color: getColors(colorName: "blue"),
          fontWeight: FontWeight.bold,
        ),
      ),
      action: SnackBarAction(
        label: 'Close',
        textColor: getColors(colorName: "red"),
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [_colorBlue, _colorLightBlue],
          ),
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(16.0),
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(
                    top: 40.0,
                    bottom: 20.0,
                  ),
                  height: 80,
                  child: Icon(
                    Icons.monetization_on,
                    size: 50,
                    color: _colorWhite,
                  )),
              Text(
                "Controle de Gastos".toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40.0,
              ),
              TextField(
                controller: _userController,
                enabled: !isLoading,
                style: TextStyle(color: _colorWhite),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(16.0),
                  prefixIcon: Container(
                      padding: const EdgeInsets.only(
                        top: 16.0,
                        bottom: 16.0,
                      ),
                      margin: const EdgeInsets.only(
                        right: 8.0,
                      ),
                      decoration: BoxDecoration(
                        color: _colorWhite,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      child: Icon(
                        Icons.person,
                        color: _colorOrange,
                      )),
                  labelText: "Informe o seu usuário",
                  labelStyle: TextStyle(
                    color: Colors.white54,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                enabled: !isLoading,
                controller: _passwordController,
                style: TextStyle(
                  color: _colorWhite,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(16.0),
                  prefixIcon: Container(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      bottom: 16.0,
                    ),
                    margin: const EdgeInsets.only(
                      right: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                    ),
                    child: Icon(
                      Icons.lock,
                      color: _colorOrange,
                    ),
                  ),
                  labelText: "Informe a sua senha",
                  //hintText:
                  labelStyle: TextStyle(
                    color: Colors.white54,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 30.0,
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.white,
                  textColor: _colorOrange,
                  padding: const EdgeInsets.all(20.0),
                  child: (isLoading)
                      ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(
                            Colors.orange,
                          ),
                        )
                      : Text("Login".toUpperCase()),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      usuario = _userController.text;
                      password = _passwordController.text;
                      _login();
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    textColor: Colors.white70,
                    child: Text("Criar Conta".toUpperCase()),
                    onPressed: () {},
                  ),
                  Container(
                    color: Colors.white54,
                    width: 2.0,
                    height: 20.0,
                  ),
                  FlatButton(
                    textColor: Colors.white70,
                    child: Text("Esqueci a senha".toUpperCase()),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() async {
    setState(() {
      isLoading = true;
    });
    var data = {'usuario': usuario, 'password': password};
    try {
      var res = await Network().authData(data, '/api/v1/login');
      var body = json.decode(res.body);
      if (body.containsKey('success') && body['success']) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', json.encode(body['token']));
        localStorage.setString('user', json.encode(body['user']));
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => NavigationScreen()));
      } else {
        _showMsg(body['message']);
      }
    } catch (e) {
      _showMsg("Ops, something went wrong");
    }

    setState(() {
      isLoading = false;
    });
  }
}
