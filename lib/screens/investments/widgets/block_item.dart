import 'package:flutter/material.dart';

import 'list_items.dart';

Container buildTile(
    {Color color,
    IconData icon,
    String title,
    String data,
    bool isLoading = false,
    String kind,
    BuildContext context}) {
  if (isLoading) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: color,
        ),
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          ),
        ));
  }
  return Container(
    child: GestureDetector(
      onTap: () {
        if (kind != null) {
          displayData(kind, context, Colors.white);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 90.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: color,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            Text(
              title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              data,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          ],
        ),
      ),
    ),
  );
}
