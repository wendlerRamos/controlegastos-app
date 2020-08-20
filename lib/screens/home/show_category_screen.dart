import 'package:controlegastos/controllers/util.dart';
import 'package:controlegastos/screens/auth/login.dart';
import 'package:controlegastos/tiles/movimentation_tile.dart';
import 'package:flutter/material.dart';
import 'package:controlegastos/controllers/request.dart';
import 'package:controlegastos/controllers/routes.dart';

class ShowCategoryScreen extends StatefulWidget {
  @override
  _ShowCategoryScreenState createState() => _ShowCategoryScreenState();
}

class _ShowCategoryScreenState extends State<ShowCategoryScreen> {
  Color backgroundColor;
  Color fontColor = getColors(colorName: 'blue');
  Color borderColor;
  
  @override
  void initState() {
    super.initState();
    getTheme();
  }

  void getTheme() {
    Map<String, Color> pallete = getThemeColors();
    backgroundColor = pallete['background'];
    borderColor = pallete['borderColor'];
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
                return buildContent(data);
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

  Widget buildContent(data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: getColors(colorName: "white"),
              border: Border.all(
                color: borderColor,
                width: 2.0,
              ),
            ),
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.school,
                    size: 100.0,
                    color: getColors(colorName: "orange"),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text(
                        'EDUCAÇÃO',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: fontColor,
                        ),
                      ),
                      Divider(
                        color: fontColor,
                        thickness: 2.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text(
                              'Gasto',
                              style: TextStyle(
                                color: fontColor,
                                fontSize: 20.0,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Text(
                              '100,00',
                              style: TextStyle(
                                  color: fontColor,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.arrow_drop_up,
                              size: 25.0,
                              color: getColors(colorName: "red"),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.transparent,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text(
                              'Média',
                              style: TextStyle(
                                color: fontColor,
                                fontSize: 20.0,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Text(
                              '80,00',
                              style: TextStyle(
                                  color: fontColor,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.arrow_left,
                              size: 25.0,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: backgroundColor,
              border: Border.all(
                color: borderColor,
                width: 2.0,
              ),
            ),
            padding: EdgeInsets.all(10.0),
            child: itemListView(data),
          ),
        ),
      ],
    );
  }

  ListView itemListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          //data[index].position, data[index].company, Icons.work
          return MovimentationTile(
            themeWhite: (index % 2 == 0),
            category: (index % 2 == 0) ? "UP" : "DOWN",
          );
        });
  }
}
