import 'package:controlegastos/controllers/util.dart';
import 'package:flutter/material.dart';
import 'package:controlegastos/controllers/routes.dart' as Routes;
import 'package:controlegastos/controllers/request.dart';
import 'package:controlegastos/tiles/investments/goal_tile.dart';

class GoalCardDashTile extends StatefulWidget {
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;

  const GoalCardDashTile(
      {Key key, this.textColor, this.backgroundColor, this.borderColor})
      : super(key: key);

  @override
  _GoalCardDashTileState createState() => _GoalCardDashTileState();
}

class _GoalCardDashTileState extends State<GoalCardDashTile> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDataFromAPI(Routes.getRoute('investments_dash_2_goals')),
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
              return _buildSuccessContent(context, snapshot.data);
            }
        }
      },
    );
  }

  Widget _buildSuccessContent(BuildContext context, Map data) {
    final metas = data['metas'];
    int size = metas.length;
    return Container(
      margin: EdgeInsets.all(8.0),
      height: 270.0,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: widget.backgroundColor,
        border: Border.all(
          color: widget.borderColor,
          width: 2.0,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Metas',
            style: TextStyle(
              color: widget.textColor,
              fontSize: 25.0,
            ),
            textAlign: TextAlign.center,
          ),
          Divider(
            color: widget.textColor,
          ),
          (size > 0) ? 
          buildItemMeta(
            backgroundColor: getColors(colorName: "blue"),
            textColor: getColors(colorName: "white"),
            data: metas[0],
          ) :
          null,
          (size > 1) ? 
          buildItemMeta(
            backgroundColor: getColors(colorName: "white"),
            textColor: getColors(colorName: "blue"),
            data: metas[1],
          ): 
          null,
          RaisedButton(
            child: Text(
              "Ver Mais",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('Opção em construção'),
                ),
              );
            },
            color: getColors(colorName: "orange"),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Container(
      margin: EdgeInsets.all(4.0),
      height: 250.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: widget.backgroundColor,
        border: Border.all(
          color: widget.borderColor,
          width: 2.0,
        ),
      ),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            widget.textColor,
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
      child: Container(
        margin: EdgeInsets.all(8.0),
        height: 250.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: widget.backgroundColor,
          border: Border.all(
            color: widget.borderColor,
            width: 2.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: 40,
              color: widget.textColor,
            ),
            Text(
              'Erro de conexão',
              style: TextStyle(
                color: widget.textColor,
              ),
            ),
            Text(
              'Toque para tentar novamente',
              style: TextStyle(
                color: widget.textColor,
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
