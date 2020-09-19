import 'package:controlegastos/deprecated_items/widgets/block_item.dart';
import 'package:controlegastos/deprecated_items/widgets/header.dart';
import 'package:controlegastos/tiles/investments/goal_tile.dart';
import 'package:controlegastos/tiles/investments/place_tile.dart';
import 'package:controlegastos/widgets/charts/investments_by_month.dart';
import 'package:flutter/material.dart';

class InvestmentsDashboardScreen extends StatefulWidget {
  @override
  _InvestmentsDashboardScreenState createState() =>
      _InvestmentsDashboardScreenState();
}

class _InvestmentsDashboardScreenState
  extends State<InvestmentsDashboardScreen> {
  final TextStyle whiteText = TextStyle(color: Colors.white);
  bool isLoading = false;
  final Color _colorBlue = Color.fromARGB(255, 3, 40, 80);
  //final Color _colorLightBlue = Color.fromARGB(255, 8, 74, 146);
  //final Color _backgroundDashColor = Color.fromARGB(255, 232, 247, 247);
  //final Color _colorWhite = Colors.white;
  final Color _colorGreen = Color.fromARGB(255, 59, 156, 0);
  //final Color _colorOrange = Color.fromARGB(255, 255, 59, 0);
  //final Color _colorRed = Color.fromARGB(255, 255, 0, 0);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildHeader(_colorBlue),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: buildTile(
                    isLoading: isLoading,
                    color: _colorBlue,
                    icon: Icons.local_atm,
                    title: "Guardados",
                    data: "9.000,00",
                    context: context,
                    kind: "teste",
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  flex: 3,
                  child: buildTile(
                    context: context,
                    isLoading: isLoading,
                    color: _colorGreen,
                    icon: Icons.trending_up,
                    title: "Rendimentos",
                    data: "1.000,00",
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 0.0, left: 15.0),
            child: Text("METAS", style: TextStyle(color: _colorBlue, fontSize: 20.0, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .4,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Card(
                  color: _colorBlue,
                  child: ListView(
                    children: <Widget> [
                      buildItemMeta(context: context),
                      buildItemMeta(context: context),
                      buildItemMeta(context: context),
                      buildItemMeta(context: context),
                      buildItemMeta(context: context),
                    ],
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 0.0, left: 15.0),
            child: Text("VALORES INVESTIDOS NOS ÚLTIMOS MESES", style: TextStyle(color: _colorBlue, fontSize: 20.0, fontWeight: FontWeight.bold , ),textAlign: TextAlign.center, ),
          ),
          
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .25,
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: InvestmentsByMonth(null),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 0.0, left: 15.0),
            child: Text("LOCAIS", style: TextStyle(color: _colorBlue, fontSize: 20.0, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: buildLocalTile(
                      isLoading: isLoading,
                      color: _colorBlue,
                      title: "Nubank",
                      data: "9.500,00",
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: buildLocalTile(
                      isLoading: isLoading,
                      color: _colorBlue,
                      title: "CDI",
                      data: "500,00",
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(children: <Widget>[
              Expanded(
                flex: 1,
                child: buildTile(
                  isLoading: isLoading,
                  color: _colorBlue,
                  icon: Icons.arrow_drop_up,
                  title: "Investidos este mês",
                  data: "500,00",
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                flex: 1,
                child: buildTile(
                  isLoading: isLoading,
                  color: _colorBlue,
                  icon: Icons.insert_chart,
                  title: "Média de investimento",
                  data: "250,00/mês",
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
