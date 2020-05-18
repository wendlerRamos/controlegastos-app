import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddMovimentationScreen extends StatefulWidget {
  @override
  _AddMovimentationScreenState createState() => _AddMovimentationScreenState();
}

enum MovimentationType { receita, despesa }

class _AddMovimentationScreenState extends State<AddMovimentationScreen> {
  final Color _colorBlue = Color.fromARGB(255, 3, 40, 80);
  Color _backgroundColor = Colors.green;
  final _formKey = GlobalKey<FormState>();
  MovimentationType _character = MovimentationType.despesa;
  String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  
  @override
  Widget build(BuildContext context) {
    if (_character == MovimentationType.despesa) {
      _backgroundColor = Colors.red;
    } else {
      _backgroundColor = Colors.green;
    }
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: _backgroundColor,
        title: Text('ADICIONAR MOVIMENTAÇÃO'),
        actions: <Widget>[],
      ),
      body: Container(
        color: _backgroundColor,
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Radio(
                      activeColor: Colors.white,
                      value: MovimentationType.despesa,
                      groupValue: _character,
                      onChanged: (MovimentationType value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                    Text('Despesa',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        )),
                    SizedBox(
                      width: 20.0,
                    ),
                    Radio(
                      activeColor: Colors.white,
                      value: MovimentationType.receita,
                      groupValue: _character,
                      onChanged: (MovimentationType value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                    Text(
                      'Receita',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ],
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
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
                          Icons.description,
                          color: _backgroundColor,
                        )),
                    labelText: "Selecione o tipo de despesa",
                    labelStyle: TextStyle(color: Colors.white54),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Preencha este campo !';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white),
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
                          Icons.monetization_on,
                          color: _backgroundColor,
                        )),
                    labelText: "Valor",
                    labelStyle: TextStyle(color: Colors.white54),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Preencha este campo !';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  initialValue: formattedDate,
                  keyboardType: TextInputType.datetime,
                  style: TextStyle(color: Colors.white),
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
                          Icons.calendar_today,
                          color: _backgroundColor,
                        )),
                    labelText: "Data",
                    labelStyle: TextStyle(color: Colors.white54),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Preencha este campo !';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  initialValue: "CRÉDITO",
                  style: TextStyle(color: Colors.white),
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
                          Icons.payment,
                          color: _backgroundColor,
                        )),
                    labelText: "Tipo de Pagamento",
                    labelStyle: TextStyle(color: Colors.white54),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Preencha este campo !';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.all(10.0),
                        color: Colors.white,
                        onPressed: () {
                          // Validate returns true if the form is valid, otherwise false.
                          if (_formKey.currentState.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.

                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('Processando ... ')));
                          }
                        },
                        child: Text('SALVAR', style: TextStyle(color: _backgroundColor, fontSize: 30.0),),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
