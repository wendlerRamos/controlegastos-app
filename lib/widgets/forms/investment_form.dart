import 'package:controlegastos/controllers/request.dart';
import 'package:controlegastos/controllers/routes.dart';
import 'package:controlegastos/controllers/util.dart';
import 'package:controlegastos/widgets/date_picker_input.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InvestmentForm extends StatefulWidget {
  final Map<String, dynamic> payload;

  const InvestmentForm({Key key, this.payload}) : super(key: key);

  @override
  _InvestmentFormState createState() => _InvestmentFormState();
}

enum MovimentationType { receita, despesa }

class _InvestmentFormState extends State<InvestmentForm> {
  final Color _backgroundColor = Color.fromARGB(255, 8, 74, 146);
  final _formKey = GlobalKey<FormState>();
  String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  var dateController = TextEditingController();
  var dueDateController = TextEditingController();
  String meta;
  String local;
  final Color textColor = getColors(colorName: "white");
  var valueController = TextEditingController();

  @override
  void initState() {
    super.initState();
    local = "${widget.payload['locals'][0]['id']}";
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          BasicDateField(
            backgroundColor: _backgroundColor,
            defaultValue: DateTime.now(),
            controller: dateController,
            isRequired: true,
            errorStyle: TextStyle(color: Colors.white),
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
            controller: valueController,
            decoration: InputDecoration(
              errorStyle: TextStyle(color: Colors.white),
              contentPadding: const EdgeInsets.all(16.0),
              prefixIcon: Container(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  bottom: 16.0,
                ),
                margin: const EdgeInsets.only(right: 8.0),
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
                  Icons.monetization_on,
                  color: _backgroundColor,
                ),
              ),
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
                flex: 14,
                child: Text(
                  "Meta",
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 16.0,
                    bottom: 16.0,
                  ),
                  margin: const EdgeInsets.only(right: 8.0),
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
                    Icons.score,
                    color: _backgroundColor,
                  ),
                ),
              ),
              Expanded(
                flex: 14,
                child: DropdownButton<String>(
                  value: "$meta",
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
                  items: widget.payload['goals']
                      .map<DropdownMenuItem<String>>((dynamic value) {
                    return DropdownMenuItem<String>(
                      value: "${value['id']}",
                      child: Text(value['nome']),
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
                flex: 14,
                child: Text(
                  "Local",
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                  margin: const EdgeInsets.only(right: 8.0),
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
                    Icons.place,
                    color: _backgroundColor,
                  ),
                ),
              ),
              Expanded(
                flex: 14,
                child: DropdownButton<String>(
                  value: "$local",
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
                      local = "$newValue";
                    });
                  },
                  dropdownColor: _backgroundColor,
                  items: widget.payload['locals']
                      .map<DropdownMenuItem<String>>((dynamic value) {
                    return DropdownMenuItem<String>(
                      value: "${value['id']}",
                      child: Text(value['nome']),
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
                      Map<String, dynamic> formDto = getDTO(context);
                      try {
                        postDataFromAPI(getRoute('save_investment'), formDto)
                            .then(
                          (_) => {
                            displaySnackBar(
                              context,
                              "Investimento criado com sucesso",
                              "success",
                            ),
                          },
                        );
                    } catch (e) {
                        displaySnackBar(
                          context,
                          "Houve um problema ao inserir",
                          "error",
                        );
                      }
                    }
                  },
                  child: Text(
                    'SALVAR',
                    style: TextStyle(
                      color: _backgroundColor,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Map<String, dynamic> getDTO(BuildContext context) {
    var formDto = <String, dynamic>{};
    formDto['id_meta'] = meta;
    formDto['id_local'] = local;
    formDto['data'] = getDate();
    formDto['valor_original'] = valueController.text.replaceAll(",", ".");
    formDto['vencimento'] = getDueDate();
    displaySnackBar(
      context,
      "Processando",
      "info",
    );
    return formDto;
  }

  String getDate() {
    var format = DateFormat("dd/MM/yyyy");
    if (dateController.text.isNotEmpty) {
      return format.parse(dateController.text).toString();
    }
    return null;
  }

  String getDueDate() {
    var format = DateFormat("dd/MM/yyyy");
    if (dueDateController.text.isNotEmpty) {
      return format.parse(dueDateController.text).toString();
    }
    return null;
  }

  void displaySnackBar(
      BuildContext scaffoldContext, String message, String status) {
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
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
