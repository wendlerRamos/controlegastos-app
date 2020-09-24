import 'package:flutter/material.dart';

Container buildLocalTile(
    {Color color,

    BuildContext context}) {
  return Container(
    child: GestureDetector(
      onTap: null,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(right: 5.0),
        height: 80.0,
        width: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: Color.fromARGB(255, 3, 40, 80),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              "Local",
              style: TextStyle(
                color: Color.fromARGB(255, 3, 40, 80),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "200,00",
              style: TextStyle(
                color: Color.fromARGB(255, 3, 40, 80),
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.arrow_drop_up,
                  color: Colors.green,
                  size: 20.0,
                ),
                Text(
                  "0,001% A.M.",
                  style: TextStyle(
                    color: Color.fromARGB(255, 3, 40, 80),
                    fontWeight: FontWeight.bold,
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
