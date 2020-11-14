import 'package:controlegastos/controllers/format_number.dart';
import 'package:controlegastos/models/investment_tile_model.dart';
import "package:flutter/material.dart";
import 'package:intl/intl.dart';

class InvestmentItemTile extends StatelessWidget {
  final InvestmentTileModel investmentData;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;

  const InvestmentItemTile(
      {Key key,
      this.borderColor,
      this.backgroundColor,
      this.textColor,
      this.investmentData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateFormat formatter = new DateFormat('dd/MM/yyyy');
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("Recurso indisponível"),
          ),
        );
      },
      child: Container(
        height: 50.0,
        padding: EdgeInsets.only(bottom: 5.0, top: 5.0, left: 5.0, right: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: borderColor,
          ),
          color: backgroundColor,
        ),
        margin: EdgeInsets.only(bottom: 10.0, top: 5.0, left: 5.0, right: 5.0),
        child: Padding(
          padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Text(((investmentData.data != null)
                    ? investmentData.data
                    : "Sem Meta")),
              ),
              Expanded(
                flex: 5,
                child: Text(
                  FormatNumberToMoney.parseNumber(investmentData.valor),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Text(
                  formatter.format(DateTime.parse(investmentData.data)),
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
