import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class DonutPieChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DonutPieChart(this.seriesList, {this.animate});

 /* 
  /// Creates a [PieChart] with sample data and no transition.
  factory DonutPieChart.withSampleData() {
    return new DonutPieChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }
  */


  @override
  Widget build(BuildContext context) {
    return new charts.PieChart( seriesList,
        animate: animate,
        // Configure the width of the pie slices to 60px. The remaining space in
        // the chart will be left as a hole in the center.
        defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: 20,
            
          arcRendererDecorators: [
            new charts.ArcLabelDecorator(
              labelPosition: charts.ArcLabelPosition.outside)
          ]
          )
        );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 200, "Mercado"),
      new LinearSales(1, 75, "Alimentação"),
      new LinearSales(2, 150, "Transporte"),
      new LinearSales(3, 480, "Contas"),
      new LinearSales(4, 50, "Outro"),
      new LinearSales(5, 80, "Saúde"),
      new LinearSales(6, 120, "Educação"),
      new LinearSales(7, 100, "Lazer"),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'proporcaoGastos',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        labelAccessorFn: (LinearSales row, _) => '${row.text}',
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;
  final String text;
  LinearSales(this.year, this.sales, this.text);
}