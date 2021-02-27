import 'package:controlegastos/controllers/request.dart';
import 'package:controlegastos/controllers/routes.dart' as Routes;
import 'package:controlegastos/controllers/util.dart';
import 'package:controlegastos/tiles/investments/place_tile.dart';
import 'package:flutter/material.dart';

class ShowLocalsScreen extends StatefulWidget {
  @override
  _ShowLocalsScreenState createState() => _ShowLocalsScreenState();
}

class _ShowLocalsScreenState extends State<ShowLocalsScreen> {
  Color backgroundColor;
  Color textColor;
  Color cardBackground;

  @override
  void initState() {
    super.initState();
    var colors = getThemeColors();
    backgroundColor = getColors(colorName: "soft_white");
    cardBackground = colors["card_background"];
    textColor = colors['textColor'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Icon(Icons.monetization_on),
            SizedBox(
              width: 10.0,
            ),
            Text('LOCAIS DE INVESTIMENTO')
          ],
        ),
        backgroundColor: getColors(colorName: "blue"),
      ),
      backgroundColor: backgroundColor,
      body: Container(
        padding: EdgeInsets.only(
          left: 10.0,
          right: 10.0,
          top: 5.0,
        ),
        child: FutureBuilder(
          future: getDataFromAPI(Routes.getRoute('get_investments_places')),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return _buildProgressIndicator();
                break;
              default:
                if (snapshot.hasError ||
                    !snapshot.hasData ||
                    snapshot.data.containsKey("error")) {
                  return _buildErrorContent();
                } else {
                  return _successContent(snapshot.data['locals'], context);
                }
            }
          },
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            textColor,
          ),
        ),
      ),
    );
  }

  Widget _successContent(List<dynamic> locals, BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(
        locals.length,
        (index) {
          return Padding(
            child: buildLocalTile(data: locals[index]),
            padding: EdgeInsets.all(5.0),
          );
        },
      ),
    );
  }

  Widget _buildErrorContent() {
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: 40,
              color: textColor,
            ),
            Text(
              'Erro de conexão',
              style: TextStyle(
                color: textColor,
              ),
            ),
            Text(
              'Toque para tentar novamente',
              style: TextStyle(
                color: textColor,
                fontSize: 12,
              ),
            ),
            Divider(
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
