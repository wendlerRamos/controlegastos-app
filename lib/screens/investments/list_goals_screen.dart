import 'package:controlegastos/controllers/request.dart';
import 'package:controlegastos/controllers/routes.dart' as Routes;
import 'package:controlegastos/controllers/util.dart';
import 'package:controlegastos/tiles/investments/goal_tile_with_image.dart';
import 'package:flutter/material.dart';

class ListGoalsScreen extends StatefulWidget {
  @override
  _ListGoalsScreenState createState() => _ListGoalsScreenState();
}

class _ListGoalsScreenState extends State<ListGoalsScreen> {
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
            Text('METAS')
          ],
        ),
        backgroundColor: getColors(colorName: "blue"),
      ),
      backgroundColor: backgroundColor,
      body: Container(
        child: FutureBuilder(
          future: getDataFromAPI(Routes.getRoute('get_goals')),
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
                  return successContent(snapshot.data, context);
                }
            }
          },
        ),
      ),
    );
  }

  Widget successContent(Map<String, dynamic> items, BuildContext context) {
    final metas = items['metas'];
    return Column(
      children: [
        Expanded(
          child: Container(
            child: ListView.builder(
              itemCount: metas.length,
              itemBuilder: (context, index) {
                final meta = metas[index];
                return GoalTileWithImage(
                  itemData: meta,
                  textColor: textColor,
                  backgroundColor: cardBackground,
                );
              },
            ),
          ),
          flex: 2,
        ),
      ],
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
