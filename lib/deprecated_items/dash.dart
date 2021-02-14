import 'dart:convert';

import 'package:controlegastos/controllers/routes.dart' as Routes;
import 'package:controlegastos/controllers/util.dart';
import 'package:controlegastos/dummy_data/movimentation.dart';
import 'package:controlegastos/models/movimentation.dart';
import 'package:controlegastos/widgets/charts/proportion_pie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../screens/home/add_movimentation_screen.dart';

String request = Routes.getRoute('home_dash_main_info');
var numberFormat =NumberFormat.simpleCurrency(locale: "BRL",);

class MainDashboard extends StatefulWidget {
  @override
  _MainDashboardState createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {

  final TextStyle whiteText = TextStyle(color: Colors.white);
  bool isLoading = false;
  final Color _colorBlue = Color.fromARGB(255, 3, 40, 80);
  final Color _colorLightBlue = Color.fromARGB(255, 8, 74, 146);
  final Color _colorRed = Color.fromARGB(255, 196, 23, 12);

  Future<Map> getDataFromAPI() async {
    //print(request);
    http.Response response = await http.get(request);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: _buildBodyContent(context),
    );
  }

  Widget _buildBodyContent(BuildContext context){
    return FutureBuilder(
      future: getDataFromAPI(),
      builder: (context, snapshot){
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator(),);
            break;
          default:
            if(snapshot.hasError || !snapshot.hasData){
              return Center(child: Text('Error 404 \n Data not Found'),);
            }else{
              return _buildBody(context, snapshot.data);
            }
        }
      },
    );
  }

  Widget _buildBody(BuildContext context, Map data) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildHeader(),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "Dashboard",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
          const SizedBox(height: 4.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: _blockTile(
                    isLoading: isLoading,
                    color: _colorRed,
                    bordered: true,
                    icon: Icons.trending_down,
                    title: "Gastos em 30 dias",
                    currentValue: numberFormat.format(data['spent_card']['total']),
                    average: numberFormat.format(data['spent_card']['avarage']),
                    kind: "despesa",
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  flex: 3,
                  child: _blockTile(
                    isLoading: isLoading,
                    color: Colors.green[900],
                    bordered: true,
                    icon: Icons.trending_up,
                    title: "Receitas em 30 dias",
                    currentValue: numberFormat.format(data['profit_card']['total']),
                    average: numberFormat.format(data['profit_card']['avarage']),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Saldos por categoria",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
            ),
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: _blockTile(
                    isLoading: isLoading,
                    color: _colorLightBlue,
                    bordered: false,
                    icon: Icons.shopping_basket,
                    title: "Mercado",
                    currentValue: numberFormat.format(data['categories']['mercado']['total']),
                    average: numberFormat.format(data['categories']['mercado']['avarage']),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: _blockTile(
                    isLoading: isLoading,
                    color: _colorLightBlue,
                    bordered: true,
                    icon: Icons.fastfood,
                    title: "Alimentação",
                    currentValue: numberFormat.format(data['categories']['alimentacao']['total']),
                    average: numberFormat.format(data['categories']['alimentacao']['avarage']),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: _blockTile(
                    isLoading: isLoading,
                    color: _colorLightBlue,
                    bordered: false,
                    icon: Icons.directions_bus,
                    title: "Transporte",
                    currentValue: numberFormat.format(data['categories']['transporte']['total']),
                    average: numberFormat.format(data['categories']['transporte']['avarage']),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: _blockTile(
                    isLoading: isLoading,
                    color: _colorLightBlue,
                    bordered: true,
                    icon: Icons.receipt,
                    title: "Contas",
                    currentValue: numberFormat.format(data['categories']['conta']['total']),
                    average: numberFormat.format(data['categories']['conta']['avarage']),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: _blockTile(
                    isLoading: isLoading,
                    color: _colorLightBlue,
                    bordered: false,
                    icon: Icons.school,
                    title: "Educação",
                    currentValue: numberFormat.format(data['categories']['educacao']['total']),
                    average: numberFormat.format(data['categories']['educacao']['avarage']),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: _blockTile(
                    isLoading: isLoading,
                    color: _colorLightBlue,
                    bordered: true,
                    icon: Icons.insert_emoticon,
                    title: "Lazer",
                    currentValue: numberFormat.format(data['categories']['lazer']['total']),
                    average: numberFormat.format(data['categories']['lazer']['avarage']),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: _blockTile(
                    isLoading: isLoading,
                    color: _colorLightBlue,
                    bordered: false,
                    icon: Icons.favorite,
                    title: "Saúde",
                    currentValue: numberFormat.format(data['categories']['saude']['total']),
                    average: numberFormat.format(data['categories']['saude']['avarage']),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  flex: 1,
                  child: _blockTile(
                    isLoading: isLoading,
                    color: _colorLightBlue,
                    bordered: true,
                    icon: Icons.scatter_plot,
                    title: "Outros",
                    currentValue: numberFormat.format(data['categories']['outro']['total']),
                    average: numberFormat.format(data['categories']['outro']['avarage']),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  flex: 1,
                  child: _blockTile(
                    isLoading: isLoading,
                    color: _colorLightBlue,
                    bordered: false,
                    icon: Icons.compare_arrows,
                    title: "% Gasto",
                    currentValue: data['categories']['porcentagem']['total'].toString(),
                    average: data['categories']['porcentagem']['avarage'].toString(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Distribuição percentual dos gastos",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
            ),
          ),
          const SizedBox(height: 8.0),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11.0),
              child: Card(
                //color: _colorLightBlue,
                child: SizedBox(
                  height: 250.0,
                  child: DonutPieChart(createPieMainDashChartData(data['chart_data'])),
                ),
              ),),
        ],
      ),
    );
  }

  Container _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        color: _colorBlue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: Text(
              "Wendler Ramos",
              style: whiteText.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
            trailing: Text(
              "01/01/2020",
              style: whiteText.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 10.0),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Container _blockTile({
    Color color,
    IconData icon,
    String title,
    String currentValue,
    String average,
    bool isLoading = false,
    String kind,
    bool bordered = false,
  }) {
    if (isLoading) {
      return Container(
        padding: const EdgeInsets.all(8.0),
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: color,
        ),
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          ),
        ),
      );
    }
    Color textColor;
    Color backgroundColor;
    if(bordered){
      textColor = color;
      backgroundColor = Colors.white;
    }else{
      textColor = Colors.white;
      backgroundColor = color;
    }
    return Container(
      child: GestureDetector(
        onTap: () async {
          if (kind != null) {
            displayData(null);
            await Future.delayed(Duration(seconds: 2));
            displayData(kind);
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: color,),
            color: backgroundColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(
                icon,
                color: textColor,
              ),
              Text(
                title,
                style: TextStyle(color: textColor, fontWeight: FontWeight.bold,)
              ),
              Text(
                currentValue,
                style:  TextStyle(color: textColor, fontWeight: FontWeight.bold,fontSize: 20.0,)
              ),
              Text(
                "Média $average",
                style:  TextStyle(color: textColor, fontWeight: FontWeight.bold,fontSize: 10.0,)
              ),
            ],
          ),
        ),
      ),
    );
  }

  void displayData(String type) {
    // Clear scaffold
    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context).showSnackBar(
      SnackBar(
        duration: Duration(hours: 1),
        backgroundColor: _colorBlue,
        content: Container(
          padding: EdgeInsets.only(left: 0.0, right: 0.0),
          height: (MediaQuery.of(context).size.height) * .75,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(child: Icon(Icons.description)),
                  Expanded(child: Icon(Icons.attach_money)),
                  Expanded(child: Icon(Icons.calendar_today)),
                ],
              ),
              Divider(
                color: Colors.white,
                height: 20.0,
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  child: ListView(children: processListOfMovimentations(type)),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Center(
                child: CloseButton(
                  color: Colors.white,
                  onPressed: () {
                    Scaffold.of(context).hideCurrentSnackBar();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> processListOfMovimentations(dataFromAPI) {
    List<Widget> listOfMovimentations = [];
    if (dataFromAPI == null) {
      final progress = Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      );
      listOfMovimentations.add(progress);
    } else {
      Movimentation data1 = Movimentation.fromJson(getMovimentationJson());
      listOfMovimentations = [
        _buildMovimentationItem(data: data1),
        _buildMovimentationItem(data: data1),
        _buildMovimentationItem(data: data1),
        _buildMovimentationItem(data: data1),
        _buildMovimentationItem(data: data1),
        _buildMovimentationItem(data: data1),
        _buildMovimentationItem(data: data1),
        _buildMovimentationItem(data: data1),
        _buildMovimentationItem(data: data1),
        _buildMovimentationItem(data: data1),
        _buildMovimentationItem(data: data1),
        _buildMovimentationItem(data: data1),
        _buildMovimentationItem(data: data1),
        _buildMovimentationItem(data: data1),
      ];
    }
    return listOfMovimentations;
  }

  GestureDetector _buildMovimentationItem(
      { Movimentation data }) {
    DateFormat formatter = new DateFormat('yyyy-MM-dd');
    var numberFormat = new NumberFormat.currency(locale: "BRL",symbol: "R\$");
    Color iconColor;
    if (data.kind == "DESPESA") {
        iconColor  = Colors.redAccent;
    }else{
        iconColor = Colors.greenAccent;
    }
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddMovimentationScreen()));
      },
      child: Column(
        children: <Widget>[
          Card(
            color: _colorBlue,
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Icon(
                      returnIconByCategory(data.category),
                      color: iconColor,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      numberFormat.format(data.value),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    formatter.format(data.date),
                    textAlign: TextAlign.end,
                    style: TextStyle(color: Colors.white),
                  )),
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
