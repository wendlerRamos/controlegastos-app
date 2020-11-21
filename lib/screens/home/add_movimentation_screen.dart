import 'package:controlegastos/controllers/request.dart';
import 'package:controlegastos/controllers/routes.dart' as Routes;
import 'package:controlegastos/widgets/date_picker_input.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddMovimentationScreen extends StatefulWidget {
  final Map<String, dynamic> data;

  const AddMovimentationScreen({Key key, this.data}) : super(key: key);

  @override
  _AddMovimentationScreenState createState() => _AddMovimentationScreenState();
}

enum MovimentationType { receita, despesa }

class _AddMovimentationScreenState extends State<AddMovimentationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final format = DateFormat("dd/MM/yyyy");
  final _formKey = GlobalKey<FormState>();

  MovimentationType movementType = MovimentationType.despesa;
  String movimentationDescription = 'MERCADO';
  String paymentType = "CREDITO";

  var customDescriptionController = TextEditingController();
  var valueController = TextEditingController();
  var dateController = TextEditingController();

  bool isOtherSelected = false;
  Color _backgroundColor;
  double valor;
  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.data != null) {
      if (widget.data['tipo'] == "RECEITA") {
        movementType = MovimentationType.receita;
      } else {
        movementType = MovimentationType.despesa;
      }
      movimentationDescription = widget.data['descricao'];
      paymentType = widget.data['tipo_pgto'];
      isOtherSelected = false;
      valor = double.parse(widget.data['valor']);
      dateTime = DateTime.parse(widget.data['data']);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (movementType == MovimentationType.despesa) {
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
                    groupValue: movementType,
                    onChanged: (MovimentationType value) {
                      setState(() {
                        movementType = value;
                      });
                    },
                  ),
                  Text(
                    'Despesa',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Radio(
                    activeColor: Colors.white,
                    value: MovimentationType.receita,
                    groupValue: movementType,
                    onChanged: (MovimentationType value) {
                      setState(() {
                        movementType = value;
                        movimentationDescription = "RECEITA";
                      });
                    },
                  ),
                  Text(
                    'Receita',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
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
                    flex: 15,
                    child: Text(
                      "Descrição",
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
                        Icons.description,
                        color: _backgroundColor,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 15,
                    child: DropdownButton<String>(
                      value: movimentationDescription,
                      icon: Icon(
                        Icons.arrow_downward,
                        color: Colors.white,
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.white,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          movimentationDescription = newValue;
                          if (newValue == "OUTRO") {
                            isOtherSelected = true;
                            customDescriptionController.text = "";
                          } else {
                            isOtherSelected = false;
                          }
                        });
                      },
                      dropdownColor: _backgroundColor,
                      items: getListOfDescriptionType()
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
                height: 8.0,
              ),
              Visibility(
                visible: isOtherSelected,
                child: TextFormField(
                  controller: customDescriptionController,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                      color: Colors.white,
                    ),
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
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      child: Icon(
                        Icons.description,
                        color: _backgroundColor,
                      ),
                    ),
                    labelText: "Descrição diferente (opcional)",
                    labelStyle: TextStyle(color: Colors.white54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
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
                controller: valueController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(16.0),
                  errorStyle: TextStyle(
                    color: Colors.white,
                  ),
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
                      Icons.monetization_on,
                      color: _backgroundColor,
                    ),
                  ),
                  labelText: "Valor",
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
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Preencha este campo !';
                  } else if (double.tryParse(value.replaceAll(",", ".")) ==
                      null) {
                    return "Isto não é um número !";
                  } else if (double.tryParse(value) == 0) {
                    return 'Não pode ser zero !';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              BasicDateField(
                backgroundColor: _backgroundColor,
                defaultValue: dateTime,
                controller: dateController,
                isRequired: true,
                errorStyle: TextStyle(color: Colors.white),
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
                    flex: 15,
                    child: Text(
                      "Tipo de pagamento",
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
                        Icons.payment,
                        color: _backgroundColor,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 15,
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
                      items: getListOfPaymentType()
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
                          Map<String, dynamic> formDto = getDTO(context);
                          postDataFromAPI(Routes.getRoute('movements'), formDto)
                              .then(
                                (_) =>
                            {
                              displaySnackbar(
                                context,
                                "Movimentação criada com sucesso",
                                "success",
                              ),
                            },
                          )
                          // ignore: non_constant_identifier_names
                              .catchError((Exception) {
                            displaySnackbar(
                              context,
                              "Houve um problema ao inserir",
                              "error",
                            );
                          });
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
        ),
      ),
    );
  }

  Map<String, dynamic> getDTO(BuildContext context) {
    var formDto = <String, dynamic>{};
    formDto['tipo'] = getMovementType();
    formDto['descricao'] = getDescription();
    formDto['data'] = getDate();
    formDto['valor'] =
        valueController.text.replaceAll(",", ".");
    formDto['tipo_pgto'] = paymentType;
    displaySnackbar(
      context,
      "Processando",
      "info",
    );
    return formDto;
  }

  String getDescription() {
    if (movimentationDescription == "OUTRO") {
      return (customDescriptionController.text.isEmpty)
          ? movimentationDescription
          : customDescriptionController.text;
    }
    return movimentationDescription;
  }

  String getMovementType(){
    if(movementType == MovimentationType.despesa){
      return "DESPESA";
    }
    return "RECEITA";
  }

  String getDate() {
    var format = DateFormat("dd/MM/yyyy");
    if (dateController.text.isNotEmpty) {
      return format.parse(dateController.text).toString();
    }
    return null;
  }

  List<String> getListOfPaymentType() {
    return <String>[
      'CREDITO',
      'DEBITO',
      'DINHEIRO',
      'TRANSFERENCIA',
      'DEPOSITO',
      'OUTRO',
    ];
  }

  List<String> getListOfDescriptionType() {
    return <String>[
      'MERCADO',
      'ALIMENTAÇÃO',
      'TRANSPORTE',
      'CONTA',
      'LAZER',
      'SAÚDE',
      'EDUCAÇÃO',
      'RECEITA',
      'OUTRO'
    ];
  }

  void displaySnackbar(BuildContext scaffoldContext, String message,
      String status) {
    Color bgColor = (status == "info")
        ? Colors.blue
        : (status == "error")
        ? Colors.red
        : Colors.green[900];
    _scaffoldKey.currentState.hideCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        backgroundColor: bgColor,
        content: Text(
          "$message",
          style: TextStyle(
            color: Colors.white, fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
