import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  Color _color_blue = Color.fromARGB(255, 3, 40, 80);
  Color _color_light_blue = Color.fromARGB(255, 8, 74, 146);
  Color _color_white = Colors.white;
  Color _color_orange = Color.fromARGB(255, 255, 59, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [_color_blue, _color_light_blue])),
        child: ListView(
          padding: EdgeInsets.all(16.0),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.only(top: 40.0, bottom: 20.0),
                height: 80,
                child: Icon(
                  Icons.monetization_on,
                  size: 50,
                  color: _color_white,
                )),
            Text(
              "Controle de Gastos".toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.0),
            TextField(
              style: TextStyle(color: _color_white),

              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16.0),
                prefixIcon: Container(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                    margin: const EdgeInsets.only(right: 8.0),
                    decoration: BoxDecoration(
                        color: _color_white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                            bottomRight: Radius.circular(10.0))),
                    child: Icon(
                      Icons.person,
                      color: _color_orange,
                    )),
                hintText: "Informe o seu usuário",
                hintStyle: TextStyle(color: Colors.white54),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              style: TextStyle(color: _color_white),

              decoration: InputDecoration(
                
                contentPadding: const EdgeInsets.all(16.0),
                prefixIcon: Container(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                    margin: const EdgeInsets.only(right: 8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                            bottomRight: Radius.circular(10.0))),
                    child: Icon(
                      Icons.lock,
                      color: _color_orange,
                    )),
                hintText: "Informe a sua senha",
                hintStyle: TextStyle(color: Colors.white54),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
                
              ),
              obscureText: true,
            ),
            SizedBox(height: 30.0),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                color: Colors.white,
                textColor: _color_orange,
                padding: const EdgeInsets.all(20.0),
                child: Text("Login".toUpperCase()),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  textColor: Colors.white70,
                  child: Text("Create Account".toUpperCase()),
                  onPressed: () {},
                ),
                Container(
                  color: Colors.white54,
                  width: 2.0,
                  height: 20.0,
                ),
                FlatButton(
                  textColor: Colors.white70,
                  child: Text("Forgot Password".toUpperCase()),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
