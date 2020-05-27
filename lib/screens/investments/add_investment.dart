import 'package:controlegastos/screens/home/widgets/date_picker_input.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddInvestmentScreen extends StatefulWidget {
  @override
  _AddInvestmentScreenState createState() => _AddInvestmentScreenState();
}

enum MovimentationType { receita, despesa }

class _AddInvestmentScreenState extends State<AddInvestmentScreen> {
  //final Color _colorBlue = Color.fromARGB(255, 3, 40, 80);
  final Color _backgroundColor = Color.fromARGB(255, 8, 74, 146);
  final _formKey = GlobalKey<FormState>();
  String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final format = DateFormat("dd/MM/yyyy");
  String meta = "NENHUMA";
  String local;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: _backgroundColor,
        title: Text('ADICIONAR INVESTIMENTO'),
        actions: <Widget>[],
      ),
      body: Container(
        color: _backgroundColor,
        padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                BasicDateField(
                  backgroundColor: _backgroundColor,
                  defaultValue: DateTime.now(),
                ),
                SizedBox(
                  height: 20.0,
                ),
                BasicDateField(
                  label: "Vencimento (opcional)",
                  backgroundColor: _backgroundColor,
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
                        "Meta",
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
                            Icons.score,
                            color: _backgroundColor,
                          )),
                    ),
                    Expanded(
                      flex: 10,
                      child: DropdownButton<String>(
                        value: meta,
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
                            meta = newValue;
                          });
                        },
                        dropdownColor: _backgroundColor,
                        items: <String>[
                          'NENHUMA',
                          'META 1',
                          'OUTRA META',
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
                      child: Container(
                        height: 5.0,
                      ),
                      flex: 2,
                    ),
                    Expanded(
                      flex: 10,
                      child: Text(
                        "Local",
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
                            Icons.place,
                            color: _backgroundColor,
                          )),
                    ),
                    Expanded(
                      flex: 10,
                      child: DropdownButton<String>(
                        value: local,
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
                            local = newValue;
                          });
                        },
                        dropdownColor: _backgroundColor,
                        items: <String>['LOCAL 1\t', 'LOCAL 2\t', 'LOCAL 3\t']
                            .map<DropdownMenuItem<String>>((String value) {
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
