import 'package:flutter/material.dart';

Container buildHeader(Color color) {
  return Container(
    padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
      ),
      color: color,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          title: Text(
            "Total Investido",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.0),
          ),
          trailing: Text(
            "10.000,00",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.0),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    ),
  );
}
