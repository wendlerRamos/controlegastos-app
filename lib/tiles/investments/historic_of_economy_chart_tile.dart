import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class HistoricOfEconomyChartTile extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  HistoricOfEconomyChartTile(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory HistoricOfEconomyChartTile.withSampleData() {
    return HistoricOfEconomyChartTile(
      _createSampleData(),
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      _createSampleData(), //change here to insert data :)
      animate: animate,
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<MonthInvestmentValue, String>> _createSampleData() {
    final data = [
      MonthInvestmentValue('dez', 100.0),
      MonthInvestmentValue('jan', 150.0),
      MonthInvestmentValue('fev', 200.0),
      MonthInvestmentValue('mar', 50.0),
      MonthInvestmentValue('abr', 250.0),
      MonthInvestmentValue('mai', 120.0),
      MonthInvestmentValue('jun', 100.0),
      MonthInvestmentValue('jul', 150.0),
      MonthInvestmentValue('ago', 60.0),
      MonthInvestmentValue('set', 50.0),
      MonthInvestmentValue('out', 120.0),
      MonthInvestmentValue('nov', 135.0),
      
    ];

    return [
      charts.Series<MonthInvestmentValue, String>(
        id: 'valor_guardado_por_mes',
        colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
        domainFn: (MonthInvestmentValue sales, _) => sales.month,
        measureFn: (MonthInvestmentValue sales, _) => sales.value,
        labelAccessorFn:(MonthInvestmentValue sales, _) => sales.value.toString(),
        data: data,        
        displayName: "Valor Guardado no Mês",

      )
    ];
  }
}

class MonthInvestmentValue {
  final String month;
  final double value;

  MonthInvestmentValue(this.month, this.value);
}
