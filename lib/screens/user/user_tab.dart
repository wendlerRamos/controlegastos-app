import 'package:controlegastos/controllers/theme.dart';
import 'package:controlegastos/controllers/util.dart';
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

  void getTheme() {
    Map<String, Color> pallete = getThemeColors();
    backgroundColor = pallete['background'];
    print("Updating Theme");
  }

  @override
  Widget build(BuildContext context) {
    getTheme();
    return SingleChildScrollView(
      
      child: Container(
        color: backgroundColor,
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Light'),
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
                  Text('Blue'),
                ],
              ),
            ),
            SizedBox(
              height: 250.0,
              child: Column(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
