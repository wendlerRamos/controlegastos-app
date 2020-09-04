import 'package:controlegastos/controllers/util.dart';
import 'package:controlegastos/screens/home/show_movimentations_screen.dart';
import 'package:controlegastos/tiles/movimentation_tile.dart';
import 'package:flutter/material.dart';
import 'package:controlegastos/controllers/request.dart';
import 'package:controlegastos/controllers/routes.dart';

class ShowCategoryScreen extends StatefulWidget {
  final String category;

  const ShowCategoryScreen({Key key, this.category}) : super(key: key);
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
                SizeRoute(
                  page: ShowMovimentationsScreen(),
                ),
              );
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
                if (snapshot.data.length == 0 || snapshot.data[1].length == 0) {
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
    final routeUrl = getRoute("home_dash_category_infos");
    final response = await getDataFromAPI(routeUrl + "${widget.category}");

    if (response != null) {
      return [response['resumo'], response['mov']];
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  Widget buildContent(data) {
    var items = data[1];
    var resume = data[0];
    Color iconColor;
    IconData iconDiff;
    resume['valor'] = double.parse(resume['valor']);
    resume['valor_media'] = double.tryParse(resume['valor_media']);
    if(resume['valor'] > resume['valor_media']){
      iconColor = getColors(colorName: "red");
      iconDiff = returnIconByCategory("UP");
    }else if(resume['valor'] == resume['valor_media']){
      iconColor = getColors(colorName: "blue");
      iconDiff = Icons.arrow_left;
    }else{
      iconColor = getColors(colorName: "green");
      iconDiff = returnIconByCategory("DOWN");
    }
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
                    returnIconByCategory(widget.category),
                    size: 100.0,
                    color: getColors(colorName: "orange"),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text(
                        '${widget.category}',
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
                              '${resume["valor"]}',
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
                              iconDiff,
                              size: 25.0,
                              color: iconColor,
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
                              '${resume["valor_media"]}',
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
            child: itemListView(items),
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
            cardInfo: data[index],
            
          );
        });
  }
}
