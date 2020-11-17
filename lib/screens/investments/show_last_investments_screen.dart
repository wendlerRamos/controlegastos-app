import 'package:controlegastos/controllers/request.dart';
import 'package:controlegastos/controllers/routes.dart';
import 'package:controlegastos/controllers/util.dart';
import 'package:controlegastos/models/investment_tile_model.dart';
import 'package:controlegastos/tiles/investments/investment_item_tile.dart';
import 'package:controlegastos/tiles/investments/search_period_of_investments_tile.dart';
import 'package:flutter/material.dart';

class ShowLastInvestmentsScreen extends StatefulWidget {
  @override
  _ShowLastInvestmentsScreenState createState() =>
      _ShowLastInvestmentsScreenState();
}

class _ShowLastInvestmentsScreenState extends State<ShowLastInvestmentsScreen> {
  var colors;
  var dateFilter;

  @override
  void initState() {
    colors = getThemeColors();
    super.initState();
    dateFilter = Map();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LISTAR INVESTIMENTOS"),
      ),
      backgroundColor: colors['background'],
      floatingActionButton: FloatingActionButton(
        backgroundColor: getColors(colorName: "orange"),
        child: Icon(
          Icons.filter_alt,
          size: 30.0,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return SearchPeriodOfInvestmentsTile(
                fromDate: (dateFilter != null && dateFilter['from'] != null)
                    ? dateFilter['fromText']
                    : null,
                untilDate: (dateFilter != null && dateFilter['until'] != null)
                    ? dateFilter['untilText']
                    : null,
              );
            },
          ).then((value) {
            if (value != null) {
              dateFilter = value;
            }
            setState(() {});
          });
        },
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(child: headerText(colors['textColor'])),
            Divider(
              color: colors['textColor'],
            ),
            Expanded(
              child: Container(
                child: RefreshIndicator(
                  onRefresh: () async {
                    setState(() {});
                  },
                  child: FutureBuilder<List>(
                    future: searchMoviments(),
                    builder: (context, snapshot) {
                      Widget result;
                      if (snapshot.hasData) {
                        if (snapshot.data.length == 0) {
                          result = noMovesFound();
                        }
                        result = itemListView(snapshot.data);
                      } else if (snapshot.hasError) {
                        result = errorView();
                      } else {
                        result = Center(child: CircularProgressIndicator());
                      }
                      return result;
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text headerText(Color textColor) {
    String text = "";
    if (dateFilter == null ||
        dateFilter.isEmpty ||
        (dateFilter['until'] == null && dateFilter['from'] == null)) {
      text = "Mostrando Últimos 20";
    } else {
      text = "Filtrando";
      if (dateFilter['from'] != null && dateFilter['from'] != "") {
        text += " De ${dateFilter['fromText']}";
      }
      if (dateFilter['until'] != null && dateFilter['until'] != "") {
        text += " Até ${dateFilter['untilText']}";
      }
    }
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: textColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Future<List> searchMoviments() async {
    final routeUrl =
        getRoute("investments_movements") + getDateParametersString();
    final response = await getDataFromAPI(routeUrl);

    if (response != null) {
      return response['movements'];
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  String getDateParametersString() {
    String response = "?";
    if (dateFilter == null ||
        !(dateFilter.containsKey('until') && dateFilter.containsKey('from'))) {
      return response;
    }
    if (dateFilter['until'] != null && dateFilter['ultil'] != "") {
      response += "&to=${dateFilter['until']}";
    }
    if (dateFilter['from'] != null && dateFilter['from'] != "") {
      response += "&from=${dateFilter['from']}";
    }
    return response;
  }

  Widget noMovesFound() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.not_interested,
          color: getColors(colorName: "orange"),
          size: 80.0,
        ),
        Text(
          "Nenhuma movimentação encontrada",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: getColors(
              colorName: 'orange',
            ),
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  ListView itemListView(data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final pairColor = getColors(colorName: 'white');
        final evenColor = getColors(colorName: 'blue');
        final item = data[index];
        InvestmentTileModel investmentModel = new InvestmentTileModel(
          BigInt.from(item['id']),
          double.tryParse(item['valor']),
          item['data'],
          item['meta'],
        );
        return InvestmentItemTile(
          borderColor: (index % 2 == 0) ? evenColor : pairColor,
          backgroundColor: (index % 2 == 0) ? pairColor : evenColor,
          textColor: (index % 2 == 0) ? evenColor : pairColor,
          investmentData: investmentModel,
        );
      },
    );
  }

  Widget errorView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.error,
          color: getColors(
            colorName: 'orange',
          ),
          size: 80.0,
        ),
        Divider(
          color: Colors.transparent,
        ),
        Text(
          "Não foi possível exibir as movimentações",
          style: TextStyle(
            color: getColors(
              colorName: 'orange',
            ),
            fontSize: 25.0,
          ),
        ),
        Divider(
          color: Colors.transparent,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tentar Novamente",
              style: TextStyle(
                color: getColors(
                  colorName: 'orange',
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                setState(() {});
              },
              child: Icon(
                Icons.settings_backup_restore,
                color: getColors(
                  colorName: 'orange',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
