import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

IconData returnIconByCategory(String category) {
  IconData icon;
  switch (category) {
    case "ALIMENTAÇÃO":
      icon = Icons.fastfood;
      break;
    case "MERCADO":
      icon = Icons.shopping_basket;
      break;
    case "TRANSPORTE":
      icon =Icons.directions_bus;
      break;
    case "CONTA":
      icon = Icons.receipt;
      break;
    case "EDUCAÇÃO":
      icon =Icons.school;
      break;
    case "LAZER":
      icon = Icons.insert_emoticon;
      break;
    case "SAÚDE":
      icon = Icons.favorite;
      break;
    default:
      icon = Icons.scatter_plot;
      break;
  }
  return icon;
}

class PieChartModel {
  final int ref;
  final double value;
  final String description;
  PieChartModel(this.ref, this.value, this.description);
}

List<charts.Series<PieChartModel, int>> createPieMainDashChartData(List listOfValues) {
    List<PieChartModel> data = [
    ];
    int index = 0;
    for (var item in listOfValues) {
      data.add(PieChartModel(index++, double.parse(item['value'].toString()), item['description']),);
    }

    return [
      new charts.Series<PieChartModel, int>(
        id: 'proporcaoGastos',
        domainFn: (PieChartModel sales, _) => sales.ref,
        measureFn: (PieChartModel sales, _) => sales.value,
        data: data,
        labelAccessorFn: (PieChartModel row, _) => '${row.description}',
      )
    ];
  }

Color getColors({String colorName}){
  switch (colorName) {
    case "blue":
      return Color.fromARGB(255, 3, 40, 80);
    case "orange":
      return Color.fromARGB(255, 255, 59, 0);
    case "soft_white":
      return Color.fromARGB(255, 234, 240, 246);
    case "white":
      return Colors.white;
    case "red":
      return Color.fromARGB(255, 196, 23, 12);
    case "green":
      return Color.fromARGB(255, 12, 196, 55);
    default:
      break;
  }
  return Color.fromARGB(255, 3, 40, 80);
}