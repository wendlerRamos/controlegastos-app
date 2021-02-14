import 'dart:convert';

import 'package:controlegastos/controllers/theme.dart';
import 'package:controlegastos/controllers/util.dart';
import 'package:controlegastos/widgets/forms/user_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserTab extends StatefulWidget {
  @override
  _UserTabState createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
  bool isSwitched;
  Color backgroundColor;

  @override
  void initState() {
    super.initState();
    getTheme();
    if (Prefs.singleton().getTheme() == "Dark") {
      isSwitched = true;
    } else {
      isSwitched = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    getTheme();
    return Container(
      color: backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: getColors(colorName: "white"),
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: FutureBuilder(
                  future: getName(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        {
                          return Container(
                            child: CircularProgressIndicator(),
                          );
                        }
                      default:
                        {
                          return UserForm(
                            name: snapshot.data,
                          );
                        }
                    }
                    return Container();
                  },
                ),
              ),
            ),
            Card(
              color: getColors(colorName: "white"),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Claro',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: getColors(colorName: "blue"),
                    ),
                  ),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                        if (isSwitched) {
                          Prefs.singleton().setTheme("Dark");
                        } else {
                          Prefs.singleton().setTheme("Light");
                        }
                      });
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green[900],
                          content: Text(
                            'Tema alterado com sucesso !',
                            style: TextStyle(
                              color: getColors(colorName: "white"),
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      );
                    },
                    activeTrackColor: Colors.blue[300],
                    activeColor: getColors(colorName: "blue"),
                  ),
                  Text(
                    'Escuro',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: getColors(colorName: "blue"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> getName() async {
    String name;
    await getUserName().then((value) => name = value);
    return name;
  }

  void getTheme() {
    Map<String, Color> pallete = getThemeColors();
    backgroundColor = pallete['background'];
  }
}
