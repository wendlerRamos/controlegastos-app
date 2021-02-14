import 'package:flutter/material.dart';

import 'list_item.dart';

void displayData(String type, BuildContext context, Color backgroudColor) {
  Scaffold.of(context).showSnackBar(SnackBar(
    duration: Duration(hours: 1),
    /*action: SnackBarAction(
          label:"X",
          textColor: Colors.white, 
          onPressed: () {
              Scaffold.of(context).hideCurrentSnackBar();
          },
        ),*/
    backgroundColor: backgroudColor,
    content: Container(
      padding: EdgeInsets.only(left: 0.0, right: 0.0),
      height: (MediaQuery.of(context).size.height) * .75,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Icon(Icons.score, color: Color.fromARGB(255, 3, 40, 80),),
                flex: 6,
              ),
              Expanded(
                child: Icon(Icons.monetization_on, color: Color.fromARGB(255, 3, 40, 80),),
                flex: 2,
              ),
              Expanded(
                child: Icon(Icons.calendar_today, color: Color.fromARGB(255, 3, 40, 80),),
                flex: 2,
              ),
            ],
          ),
          Divider(
            color: Color.fromARGB(255, 3, 40, 80),
            height: 20.0,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Container(
            child: ListView(
              children: <Widget>[
                buildItem(context: context, color: Colors.blue[900]),
                buildItem(context: context, color: Colors.blue[700]),
                buildItem(context: context, color: Colors.blue[900]),
                buildItem(context: context, color: Colors.blue[700]),
                buildItem(context: context, color: Colors.blue[900]),
                buildItem(context: context, color: Colors.blue[700]),
                buildItem(context: context, color: Colors.blue[900]),
                buildItem(context: context, color: Colors.blue[700]),
                buildItem(context: context, color: Colors.blue[900]),
                buildItem(context: context, color: Colors.blue[700]),
                buildItem(context: context, color: Colors.blue[900]),
                buildItem(context: context, color: Colors.blue[700]),
                buildItem(context: context, color: Colors.blue[900]),
                buildItem(context: context, color: Colors.blue[700]),
                buildItem(context: context, color: Colors.blue[900]),
                buildItem(context: context, color: Colors.blue[700]),
                buildItem(context: context, color: Colors.blue[900]),
                buildItem(context: context, color: Colors.blue[700]),
              ],
            ),
          )),
          SizedBox(
            height: 8.0,
          ),
          Center(
            child: CloseButton(
              color: Colors.redAccent,
              onPressed: () {
                Scaffold.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        ],
      ),
    ),
  ));
}
