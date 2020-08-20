import 'package:controlegastos/controllers/util.dart';
import 'package:controlegastos/screens/auth/login.dart';
import 'package:controlegastos/tiles/movimentation_tile.dart';
import 'package:flutter/material.dart';
import 'package:controlegastos/controllers/request.dart';
import 'package:controlegastos/controllers/routes.dart';

class ShowMovimentationsScreen extends StatefulWidget {
  @override
  _ShowMovimentationsScreenState createState() =>
      _ShowMovimentationsScreenState();
}

class _ShowMovimentationsScreenState extends State<ShowMovimentationsScreen> {
  Color backgroundColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTheme();
  }

  void getTheme() {
    Map<String, Color> pallete = getThemeColors();
    backgroundColor = pallete['background'];
    print("Updating Theme");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Icon(Icons.monetization_on),
            SizedBox(
              width: 5.0,
            ),
            Text('CONTROLE DE GASTOS')
          ],
        ),
        backgroundColor: getColors(colorName: "blue"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'Sair',
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
      body: Container(
        color: backgroundColor,
        child: Center(
          child: FutureBuilder<List>(
            future: searchMoviments(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<dynamic> data = snapshot.data;
                if (snapshot.data.length == 0) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.not_interested,
                        color: getColors(colorName: "orange"),
                        size: 80.0,
                      ),
                      Text(
                        "Nenhuma movimentação encontrada",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: getColors(
                              colorName: 'orange',
                            ),
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  );
                }
                return itemListView(data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  Future<List> searchMoviments() async {
    final routeUrl = getRoute("movimentations_list");

    //final jobsListAPIUrl = 'https://mock-json-service.glitch.me/';
    final response = await getDataFromAPI(routeUrl);

    if (response != null) {
      return response['mov'];
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  ListView itemListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          //data[index].position, data[index].company, Icons.work
          return MovimentationTile(
            themeWhite: (index % 2 == 0),
          );
        });
  }
}
