import 'package:controlegastos/controllers/request.dart';
import 'package:controlegastos/controllers/util.dart';
import 'package:controlegastos/models/chart_investments_model.dart';
import 'package:controlegastos/tiles/investments/historic_of_economy_chart_tile.dart';
import 'package:flutter/material.dart';

class InvestmentsByMonthTile extends StatefulWidget {
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final String route;

  const InvestmentsByMonthTile(
      {Key key, this.textColor, this.backgroundColor, this.borderColor, this.route})
      : super(key: key);

  @override
  _InvestmentsByMonthTileState createState() => _InvestmentsByMonthTileState();
}

class _InvestmentsByMonthTileState extends State<InvestmentsByMonthTile> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDataFromAPI(widget.route),
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
              return _buildSuccessContent(snapshot.data);
            }
        }
      },
    );
  } 

  Widget _buildSuccessContent(Map data) {
    return Container(
      margin: EdgeInsets.all(8.0),
      height: 250.0,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: widget.backgroundColor,
        border: Border.all(
          color: widget.borderColor,
          width: 2.0,
        ),
      ),
      child: Column(
        children: [
          Text(
            'Historico de economia por mês',
            style: TextStyle(
              color: getColors(colorName: 'blue'),
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: HistoricOfEconomyChartTile(parseResposeToList(data['investments_by_month'])),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {

    return Container(
      margin: EdgeInsets.all(4.0),
      height: 250.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: widget.backgroundColor,
        border: Border.all(
          color: widget.borderColor,
          width: 2.0,
        ),
      ),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            widget.textColor,
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
      child: Container(
        margin: EdgeInsets.all(8.0),
        height: 250.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: widget.backgroundColor,
          border: Border.all(
            color: widget.borderColor,
            width: 2.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: 40,
              color: widget.textColor,
            ),
            Text(
              'Erro de conexão',
              style: TextStyle(
                color: widget.textColor,
              ),
            ),
            Text(
              'Toque para tentar novamente',
              style: TextStyle(
                color: widget.textColor,
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

  List<MonthInvestmentValue> parseResposeToList(List response){
    List<MonthInvestmentValue> parsedList = [];
    for (var value in response) {
      parsedList.add(MonthInvestmentValue(value['month'], double.parse(value['valor'])));
    }
    return parsedList;
  }
}
