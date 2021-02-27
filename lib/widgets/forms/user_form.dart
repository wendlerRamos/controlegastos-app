import 'dart:convert';

import 'package:controlegastos/controllers/request.dart';
import 'package:controlegastos/controllers/routes.dart';
import 'package:controlegastos/controllers/util.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserForm extends StatefulWidget {
  final String name;

  const UserForm({Key key, this.name}) : super(key: key);

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Text(
            "Editar Informações",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: getColors(colorName: "blue"),
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
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: getColors(colorName: "blue"),
                  width: 1.0,
                ),
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
              labelText: "Senha (Informe apenas se for alterá-la)",
              labelStyle: TextStyle(
                color: getColors(colorName: "blue"),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: getColors(colorName: "blue"),
                  width: 1.0,
                ),
              ),
            ),
            controller: passwordController,
            validator: (value) {
              if (value.toString().length > 0 && value.toString().length < 8) {
                return "Necesário mais que 8 caracteres";
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: getColors(colorName: "blue"),
                  width: 1.0,
                ),
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
                var formDto = <String, dynamic>{};
                formDto['name'] = nameController.text;
                if (passwordController.text.length > 0) {
                  formDto['password'] = passwordController.text;
                }
                displaySnackBar(context, "Processando", "info");
                putDataFromAPI(getRoute('update_user'), formDto)
                    .then(
                  (_) => {
                    displaySnackBar(
                      context,
                      "Atualizado com sucesso",
                      "success",
                    ),
                    updateUserOnStorage(json.encode(_['user'])),
                    passwordController.text = "",
                    confirmPasswordController.text = "",
                    //getName(),
                  },
                )
                    .catchError((Exception) {
                  displaySnackBar(
                    context,
                    "Houve um problema na atualização",
                    "error",
                  );
                });
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
    );
  }

  void displaySnackBar(BuildContext context, String message, String status) {
    Color bgColor = (status == "info")
        ? Colors.blue
        : (status == "error")
            ? Colors.red
            : Colors.green[900];
    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context).showSnackBar(
      SnackBar(
        backgroundColor: bgColor,
        content: Text(
          "$message",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void updateUserOnStorage(String user) {
    SharedPreferences.getInstance().then(
      (value) => {value.setString('user', user)},
    );
  }
}
