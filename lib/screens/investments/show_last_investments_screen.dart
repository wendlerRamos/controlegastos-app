import 'package:controlegastos/controllers/util.dart';
import 'package:controlegastos/tiles/investments/search_period_of_investments_tile.dart';
import 'package:flutter/material.dart';

class ShowLastInvestmentsScreen extends StatefulWidget {
  @override
  _ShowLastInvestmentsScreenState createState() =>
      _ShowLastInvestmentsScreenState();
}

class _ShowLastInvestmentsScreenState extends State<ShowLastInvestmentsScreen> {
  var colors;
  var dateFilter = Map();

  @override
  void initState() {
    colors = getThemeColors();
    super.initState();
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
              return SearchPeriodOfInvestmentsTile();
            },
          ).then((value) => dateFilter = value);
        },
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: colors['background'],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
