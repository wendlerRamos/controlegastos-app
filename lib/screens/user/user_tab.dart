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
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
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
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Text(
                        "Editar Informações",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        color: getColors(colorName: "blue"),
                        thickness: 1.5,
                        height: 30.0,
                      ),
                      TextFormField(
                        style: TextStyle(
                          color: getColors(colorName: "blue"),
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(16.0),
                          labelText: "Nome",
                          labelStyle: TextStyle(
                            color: getColors(colorName: "blue"),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        controller: nameController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Este atributo é obrigatório";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        style: TextStyle(
                          color: getColors(colorName: "blue"),
                        ),
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(16.0),
                          labelText: "Senha",
                          labelStyle: TextStyle(
                            color: getColors(colorName: "blue"),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        controller: passwordController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Este atributo é obrigatório";
                          }
                          if (value.toString().length < 8) {
                            return "Necesário mais que 8 caracteres";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.always,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        style: TextStyle(
                          color: getColors(colorName: "blue"),
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(16.0),
                          labelText: "Confirmar Senha",
                          labelStyle: TextStyle(
                            color: getColors(colorName: "blue"),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        obscureText: true,
                        controller: confirmPasswordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value != passwordController.text) {
                            return "As senhas precisam ser iguais";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      RaisedButton(
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Sending updates"),
                              ),
                            );
                          }
                        },
                        color: getColors(colorName: "blue"),
                        textColor: getColors(colorName: "white"),
                        child: Text(
                          "SALVAR",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Claro',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
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
}
