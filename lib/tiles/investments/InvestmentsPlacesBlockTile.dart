import 'package:controlegastos/controllers/util.dart';
import 'package:controlegastos/tiles/investments/place_tile.dart';
import 'package:flutter/material.dart';

class InvestmentsPlacesBlockTile extends StatefulWidget {
  @override
  _InvestmentsPlacesBlockTileState createState() =>
      _InvestmentsPlacesBlockTileState();
}

class _InvestmentsPlacesBlockTileState
    extends State<InvestmentsPlacesBlockTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: buildLocalTile(),
            flex: 1,
          ),
          SizedBox(
            width: 25.0,
          ),
          Expanded(
            child: buildLocalTile(),
            flex: 1,
          ),
          SizedBox(
            width: 25.0,
          ),
          Expanded(
            flex: 1,
            child: RaisedButton(
              onPressed: () {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Tela incompleta"),
                  ),
                );
              },
              color: getColors(colorName: "orange"),
              child: Container(
                height: 60.0,
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.arrow_forward,
                      color: getColors(colorName: "soft_white"),
                      size: 30.0,
                    ),
                    Text(
                      "Ver Mais",
                      style: TextStyle(
                        color: getColors(
                          colorName: "soft_white",
                        ),
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
