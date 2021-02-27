import 'package:controlegastos/controllers/request.dart';
import 'package:controlegastos/controllers/routes.dart';
import 'package:controlegastos/controllers/util.dart';
import 'package:controlegastos/widgets/forms/investment_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddInvestmentScreen extends StatefulWidget {
  @override
  _AddInvestmentScreenState createState() => _AddInvestmentScreenState();
}

enum MovimentationType { receita, despesa }

class _AddInvestmentScreenState extends State<AddInvestmentScreen> {
  final Color _backgroundColor = Color.fromARGB(255, 8, 74, 146);
  final _formKey = GlobalKey<FormState>();
  String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final format = DateFormat("dd/MM/yyyy");
  String meta = "NENHUMA";
  String local;
  final Color textColor = getColors(colorName: "white");

  @override
  void initState() {
    super.initState();
  }

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
        child: FutureBuilder(
          future: getGoalsAndPlaces(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return _buildProgressIndicator();
                break;
              default:
                if (snapshot.hasError ||
                    !snapshot.hasData ||
                    snapshot.data.containsKey("error")) {
                  return _buildErrorContent();
                } else {
                  return InvestmentForm(
                    payload: snapshot.data,
                  );
                }
            }
          },
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> getGoalsAndPlaces() async {
    Map<String, dynamic> payload = {};
    await Future.wait([
      getDataFromAPI(getRoute('get_places_names')),
      getDataFromAPI(getRoute('get_goals_names')),
    ]).then((value) => {
          payload["locals"] = value[0]['locals'],
          payload["goals"] = value[1]['goals'],
          payload["goals"].add({"id": null, "nome": "SEM META"})
        });
    return payload;
  }

  Widget _buildProgressIndicator() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            textColor,
          ),
        ),
      ),
    );
  }

  Widget _buildErrorContent() {
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: 40,
              color: textColor,
            ),
            Text(
              'Erro de conexão',
              style: TextStyle(
                color: textColor,
              ),
            ),
            Text(
              'Toque para tentar novamente',
              style: TextStyle(
                color: textColor,
                fontSize: 12,
              ),
            ),
            Divider(
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
