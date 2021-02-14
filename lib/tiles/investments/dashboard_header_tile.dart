import 'package:controlegastos/controllers/util.dart';
import 'package:flutter/material.dart';

class DashboardHeaderTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        color: getColors(colorName: "blue"),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: Text(
              "Wendler Ramos",
              style: TextStyle(
                  color: getColors(colorName: "white"),
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
            ),
            trailing: Text(
              "01/01/2020",
              style: TextStyle(
                  color: getColors(colorName: "white"),
                  fontWeight: FontWeight.bold,
                  fontSize: 10.0),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
