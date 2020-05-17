import 'package:controlegastos/screens/home/widgets/charts/proportion_pie.dart';
import 'package:flutter/material.dart';

class MainDashboard extends StatefulWidget {
  @override
  _MainDashboardState createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  final TextStyle whiteText = TextStyle(color: Colors.white);
  bool isLoading = false;
  final Color _colorBlue = Color.fromARGB(255, 3, 40, 80);
  final Color _colorLightBlue = Color.fromARGB(255, 8, 74, 146);
  //final Color _colorWhite = Colors.white;
  final Color _colorOrange = Color.fromARGB(255, 255, 59, 0);
  final Color _colorRed = Color.fromARGB(255, 255, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
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
                  child: _buildTile(
                    isLoading: isLoading,
                    color: _colorRed,
                    icon: Icons.trending_down,
                    title: "Gastos em 30 dias",
                    data: "1.200,00",
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  flex: 2,
                  child: _buildTile(
                    isLoading: isLoading,
                    color: Colors.green,
                    icon: Icons.trending_up,
                    title: "Receitas em 30 dias",
                    data: "900,00",
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: 200.0,
              child: DonutPieChart(
                []
              ),
            ),
          ),
          const SizedBox(height: 4.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: _buildTile(
                    isLoading: isLoading,
                    color: _colorOrange,
                    icon: Icons.shopping_basket,
                    title: "Mercado",
                    data: "300,00",
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: _buildTile(
                    isLoading: isLoading,
                    color: _colorLightBlue,
                    icon: Icons.fastfood,
                    title: "Alimentação",
                    data: "150,00",
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: _buildTile(
                    isLoading: isLoading,
                    color: _colorOrange,
                    icon: Icons.directions_bus,
                    title: "Transporte",
                    data: "200,00",
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
                  child: _buildTile(
                    isLoading: isLoading,
                    color: _colorLightBlue,
                    icon: Icons.receipt,
                    title: "Contas",
                    data: "750,00",
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: _buildTile(
                    isLoading: isLoading,
                    color: _colorOrange,
                    icon: Icons.school,
                    title: "Educação",
                    data: "150,00",
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: _buildTile(
                    isLoading: isLoading,
                    color: _colorLightBlue,
                    icon: Icons.insert_emoticon,
                    title: "Lazer",
                    data: "80,00",
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
                  child: _buildTile(
                    isLoading: isLoading,
                    color: _colorOrange,
                    icon: Icons.favorite,
                    title: "Saúde",
                    data: "50,00",
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: _buildTile(
                    isLoading: isLoading,
                    color: _colorLightBlue,
                    icon: Icons.scatter_plot,
                    title: "Outros",
                    data: "250,00",
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: _buildTile(
                    isLoading: isLoading,
                    color: Colors.green,
                    icon: Icons.arrow_drop_up,
                    title: "Receita",
                    data: "1.200,00",
                  ),
                ),
              ],
            ),
          ),
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

  Container _buildTile(
      {Color color, IconData icon, String title, String data, bool isLoading=false}) {
    if(isLoading){
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
      )
    );
    }
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 120.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            title,
            style: whiteText.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            data,
            style:
                whiteText.copyWith(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}