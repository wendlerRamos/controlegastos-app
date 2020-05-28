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
                color: Colors.orange[200],
              )));
    },
    child: Column(
      children: <Widget>[
        Card(
            color: color,
            child: Container(
              padding: EdgeInsets.only(
                  bottom: 10.0, top: 10.0, left: 5.0, right: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(
                  color: Color.fromARGB(255, 3, 40, 80),
                ),
                color: Colors.white,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: Text(
                      "Meta 1",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color.fromARGB(255, 3, 40, 80), fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "1.050,00",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color.fromARGB(255, 3, 40, 80), fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Text(
                        "01/01/2020",
                        textAlign: TextAlign.end,
                        style: TextStyle(color: Color.fromARGB(255, 3, 40, 80), fontWeight: FontWeight.bold),
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
