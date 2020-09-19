import 'package:controlegastos/tiles/investments/dashboard_header_tile.dart';
import 'package:controlegastos/tiles/investments/historic_of_economy_chart_tile.dart';
import 'package:controlegastos/tiles/investments/investments_by_month_card_tile.dart';
import 'package:controlegastos/tiles/investments/investments_dashboard_resume_block_tile.dart';
import 'package:flutter/material.dart';
import 'package:controlegastos/controllers/util.dart';

class InvestmentsDashboardTab extends StatefulWidget {
  @override
  _InvestmentsDashboardTabState createState() =>
      _InvestmentsDashboardTabState();
}

class _InvestmentsDashboardTabState extends State<InvestmentsDashboardTab> {
  Color backgroundColor;
  Color borderColor;
  Color textColor;

  @override
  void initState() {
    super.initState();
    getTheme();
  }

  void getTheme() {
    Map<String, Color> pallete = getThemeColors();
    backgroundColor = pallete['background'];
    borderColor = pallete['borderColor'];
    textColor = pallete['textColor'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DashboardHeaderTile(),
            InvestmentsDashboardResumeBlockTile(
              backgroundColor: backgroundColor,
              borderColor: borderColor,
              textColor: textColor,
            ),
            InvestmentsByMonthTile(
              backgroundColor: backgroundColor,
              borderColor: borderColor,
              textColor: textColor,
            ),
          ],
        ),
      ),
    );
  }
}
