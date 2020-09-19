import 'package:flutter/material.dart';

Container buildLocalTile(
    {Color color,
    String title,
    String data,
    bool isLoading = false,
    String kind,
    BuildContext context}) {
  if (isLoading) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        height: 60.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: color,
        ),
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Color.fromARGB(255, 3, 40, 80),
          ),
        ));
  }
  return Container(
    child: GestureDetector(
      onTap: () {
        if (kind != null) {
          
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(right: 5.0),
        height: 80.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(color: Color.fromARGB(255, 3, 40, 80),),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              title,
              style:
                  TextStyle(color: Color.fromARGB(255, 3, 40, 80), fontWeight: FontWeight.bold),
            ),
            Text(
              data,
              style: TextStyle(
                  color: Color.fromARGB(255, 3, 40, 80),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.arrow_drop_up, color: Colors.green, size: 20.0,),
                Text(
                  "0,001% A.M.",
                  style: TextStyle(
                      color: Color.fromARGB(255, 3, 40, 80),
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0),
                ),
            ],)
          ],
        ),
      ),
    ),
  );
}
