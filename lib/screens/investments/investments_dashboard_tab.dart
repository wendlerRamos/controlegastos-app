import 'package:controlegastos/controllers/routes.dart';
import 'package:controlegastos/controllers/util.dart';
import 'package:controlegastos/tiles/header.dart';
import 'package:controlegastos/tiles/investments/InvestmentsPlacesBlockTile.dart';
import 'package:controlegastos/tiles/investments/goal_card_dash_tile.dart';
import 'package:controlegastos/tiles/investments/investments_by_month_card_tile.dart';
import 'package:controlegastos/tiles/investments/investments_dashboard_resume_block_tile.dart';
import 'package:flutter/material.dart';

class InvestmentsDashboardTab extends StatefulWidget {
  @override
  _InvestmentsDashboardTabState createState() =>
      _InvestmentsDashboardTabState();
}

class _InvestmentsDashboardTabState extends State<InvestmentsDashboardTab> {
  Color backgroundColor;
  Color cardBackgroundColor;
  Color borderColor;
  Color textColor;

  @override
  void initState() {
    super.initState();
    getTheme();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getTheme() {
    Map<String, Color> pallete = getThemeColors();
    backgroundColor = pallete['background'];
    cardBackgroundColor = pallete['card_background'];
    borderColor = pallete['borderColor'];
    textColor = pallete['textColor'];
  }

  @override
  Widget build(BuildContext context) {
    getTheme();
    return RefreshIndicator(
      child: Container(
        color: backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HeaderTile(),
              InvestmentsDashboardResumeBlockTile(
                backgroundColor: cardBackgroundColor,
                borderColor: borderColor,
                textColor: textColor,
              ),
              InvestmentsByMonthTile(
                backgroundColor: getColors(colorName: 'white'),
                borderColor: borderColor,
                textColor: textColor,
                route: getRoute('investments_dash_chart_by_month'),
              ),
              GoalCardDashTile(
                backgroundColor: cardBackgroundColor,
                borderColor: borderColor,
                textColor: textColor,
              ),
              InvestmentsPlacesBlockTile(
                backgroundColor: backgroundColor,
                borderColor: borderColor,
                textColor: textColor,
              ),
            ],
          ),
        ),
      ),
      onRefresh: refreshScreen,
      color: getColors(colorName: "orange"),
      backgroundColor: Colors.transparent,
    );
  }

  Future<void> refreshScreen() async{
    setState(() {

    });
  }
}
