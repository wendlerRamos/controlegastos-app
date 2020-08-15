import 'package:controlegastos/widgets/date_picker_input.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddMovimentationScreen extends StatefulWidget {
  @override
  _AddMovimentationScreenState createState() => _AddMovimentationScreenState();
}

enum MovimentationType { receita, despesa }

class _AddMovimentationScreenState extends State<AddMovimentationScreen> {
  //final Color _colorBlue = Color.fromARGB(255, 3, 40, 80);
  Color _backgroundColor = Colors.green;
  final _formKey = GlobalKey<FormState>();
  MovimentationType _character = MovimentationType.despesa;
  String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String movimentationDescription = 'MERCADO';
  String paymentType = "CRÉDITO";
  bool isOtherSelected = false;
  final format = DateFormat("dd/MM/yyyy");
  @override
  Widget build(BuildContext context) {
    if (_character == MovimentationType.despesa) {
      _backgroundColor = Colors.red[900];
    } else {
      _backgroundColor = Colors.green[900];
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
                          movimentationDescription = "RECEITA";
                        });
                      },
                    ),
                    Text(
                      'Receita',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 5.0,
                      ),
                      flex: 2,
                    ),
                    Expanded(
                      flex: 10,
                      child: Text(
                        "Descrição",
                        style: TextStyle(
                          color: Colors.white54,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                          padding:
                              const EdgeInsets.only(top: 16.0, bottom: 16.0),
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
                    ),
                    Expanded(
                      flex: 10,
                      child: DropdownButton<String>(
                        value: movimentationDescription,
                        icon: Icon(
                          Icons.arrow_downward,
                          color: Colors.white,
                        ),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.white),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            movimentationDescription = newValue;
                            if (newValue == "OUTRO") {
                              isOtherSelected = true;
                            } else {
                              isOtherSelected = false;
                            }
                          });
                        },
                        dropdownColor: _backgroundColor,
                        items: <String>[
                          'MERCADO',
                          'ALIMENTAÇÃO',
                          'TRANSPORTE',
                          'CONTA',
                          'LAZER',
                          'SAÚDE',
                          'EDUCAÇÃO',
                          'RECEITA',
                          'OUTRO'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Visibility(
                  visible: isOtherSelected,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16.0),
                      prefixIcon: Container(
                          padding:
                              const EdgeInsets.only(top: 16.0, bottom: 16.0),
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
                      labelText: "Descrição diferente (opcional)",
                      labelStyle: TextStyle(color: Colors.white54),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                    ),
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
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
                SizedBox(
                  height: 20.0,
                ),
                BasicDateField(
                  backgroundColor: _backgroundColor,
                  defaultValue: DateTime.now(),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 5.0,
                      ),
                      flex: 2,
                    ),
                    Expanded(
                      flex: 10,
                      child: Text(
                        "Tipo de pagamento",
                        style: TextStyle(
                          color: Colors.white54,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                          padding:
                              const EdgeInsets.only(top: 16.0, bottom: 16.0),
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
                    ),
                    Expanded(
                      flex: 10,
                      child: DropdownButton<String>(
                        value: paymentType,
                        icon: Icon(
                          Icons.arrow_downward,
                          color: Colors.white,
                        ),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.white),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            paymentType = newValue;
                          });
                        },
                        dropdownColor: _backgroundColor,
                        items: <String>[
                          'CRÉDITO',
                          'DÉBITO',
                          'DINHEIRO',
                          'TRANSFERÊNCIA',
                          'DEPÓSITO',
                          'OUTRO',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.all(10.0),
                        color: Colors.white,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _scaffoldKey.currentState.showSnackBar(
                                SnackBar(content: Text('Processando ... ')));
                          }
                        },
                        child: Text(
                          'SALVAR',
                          style: TextStyle(
                              color: _backgroundColor, fontSize: 30.0),
                        ),
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
