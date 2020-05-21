import 'package:flutter/material.dart';

GestureDetector buildItem(
    {Color color,
    Color backgroundColor,
    IconData icon,
    String value,
    String data,
    String kind,
    BuildContext context}) {
  if (color == null) {
    color = Colors.redAccent;
  }
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Container(
                color: Colors.orange,
              )));
    },
    child: Column(
      children: <Widget>[
        Card(
            color: Colors.orange,
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Icon(
                    Icons.fastfood,
                    color: color,
                  )),
                  Expanded(
                    child: Text(
                      "50,00",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    "01/01/2020",
                    textAlign: TextAlign.end,
                    style: TextStyle(color: Colors.white),
                  )),
                ],
              ),
            )),
        Divider(
          color: Colors.white,
        ),
      ],
    ),
  );
}
