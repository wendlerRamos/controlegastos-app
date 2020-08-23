import 'package:controlegastos/screens/home/show_movimentations_screen.dart';
import 'package:flutter/material.dart';
import 'package:controlegastos/controllers/util.dart';
import 'package:controlegastos/controllers/routes.dart' as Routes;
import 'package:controlegastos/controllers/request.dart';

class HomeMainInfoTile extends StatefulWidget {
  @override
  _HomeMainInfoTileState createState() => _HomeMainInfoTileState();
}

class _HomeMainInfoTileState extends State<HomeMainInfoTile> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDataFromAPI(Routes.getRoute('home_dash_main_info')),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Expanded(
              child: Card(
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      getColors(colorName: 'orange'),
                    ),
                  ),
                ),
              ),
            );
            break;
          default:
            if (snapshot.hasError || !snapshot.hasData) {
              return _buildErrorContent();
            } else {
              return _buildContent(context, snapshot.data);
            }
        }
      },
    );
  }

  Widget _buildErrorContent() {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          setState(() {});
        },
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
                size: 80,
                color: getColors(colorName: "red"),
              ),
              Divider(),
              Text(
                'Erro de conexão',
                style: TextStyle(
                  color: getColors(colorName: "red"),
                ),
              ),
              Text(
                'Toque para tentar novamente',
                style: TextStyle(
                  color: getColors(colorName: "blue"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, Map data) {
    data = data['resumo'];
    Color earningsLabel;
    Color expansesLabel;
    int percentEarnings = 0;
    if (data['valor_receita_media'] != 0) {
      percentEarnings =
          ((data['valor_receita'] / data['valor_receita_media']) * 100).floor();
    }
    if (percentEarnings <= 100) {
      earningsLabel = getColors(colorName: "orange");
    } else {
      earningsLabel = getColors(colorName: "green");
    }
    int percentExpanses = 0;
    if (data['valor_gasto_media'] != 0) {
      percentExpanses =
          ((data['valor_gasto'] / data['valor_gasto_media']) * 100).floor();
    }
    if (percentExpanses > 100) {
      expansesLabel = getColors(colorName: "orange");
    } else {
      expansesLabel = getColors(colorName: "green");
    }
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ShowMovimentationsScreen(),
            ),
          );
        },
        onLongPress: (){
          setState(() {
            
          });
        },
        child: Container(
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: getColors(colorName: "white"),
            border: Border.all(
              color: getColors(colorName: "blue"),
              width: 2.0,
            ),
          ),
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Neste Mês",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: getColors(colorName: "blue"),
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              Divider(
                color: Colors.transparent,
              ),
              Row(
                children: [
                  Expanded(
                    child: Icon(
                      Icons.keyboard_arrow_up,
                      color: getColors(colorName: "green"),
                      size: 50.0,
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Text(
                      "${data['valor_receita']}".replaceAll(".", ","),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: getColors(colorName: "blue"),
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                      ),
                    ),
                    flex: 5,
                  ),
                  Expanded(
                    child: Text(
                      "( $percentEarnings% da média )",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: earningsLabel,
                        fontStyle: FontStyle.italic,
                        fontSize: 25.0,
                      ),
                    ),
                    flex: 5,
                  ),
                ],
              ),
              Divider(
                color: getColors(colorName: "blue"),
                thickness: 2.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: getColors(colorName: "red"),
                      size: 50.0,
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Text(
                      "${data['valor_gasto']}".replaceAll(".", ","),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: getColors(colorName: "blue"),
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                      ),
                    ),
                    flex: 5,
                  ),
                  Expanded(
                    child: Text(
                      "( $percentExpanses% da média )",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: expansesLabel,
                        fontStyle: FontStyle.italic,
                        fontSize: 25.0,
                      ),
                    ),
                    flex: 5,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
