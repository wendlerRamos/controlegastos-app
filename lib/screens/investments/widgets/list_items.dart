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
              Expanded(child: Icon(Icons.description)),
              Expanded(child: Icon(Icons.attach_money)),
              Expanded(child: Icon(Icons.calendar_today)),
            ],
          ),
          Divider(
            color: Colors.white,
            height: 20.0,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Container(
            child: ListView(
              children: <Widget>[
                buildItem(context: context,),
                buildItem(context: context,),
                buildItem(context: context,color: Colors.green),
                buildItem(context: context,),
                buildItem(context: context,),
                buildItem(context: context,color: Colors.green),
                buildItem(context: context,),
                buildItem(context: context,),
                buildItem(context: context,),
                buildItem(context: context,color: Colors.green),
                buildItem(context: context,),
                buildItem(context: context,),
                buildItem(context: context,),
                buildItem(context: context,),
              ],
            ),
          )),
          SizedBox(
            height: 8.0,
          ),
          Center(
            child: CloseButton(
              color: Colors.white,
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
