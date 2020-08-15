/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class InvestmentsByMonth extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  InvestmentsByMonth(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory InvestmentsByMonth.withSampleData() {
    return new InvestmentsByMonth(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      
      _createSampleData(), //change here to insert data :)
      animate: animate,
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('dez', 5),
      new OrdinalSales('jan', 25),
      new OrdinalSales('fev', 100),
      new OrdinalSales('mar', 75),
      new OrdinalSales('abr', 80),
      new OrdinalSales('mai', 25),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Valor Investido',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}