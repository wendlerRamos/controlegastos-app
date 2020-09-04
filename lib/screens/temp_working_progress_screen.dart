import 'package:flutter/material.dart';

class WorkingProgressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.build,
              color: Colors.yellow[900],
              size: 100.0,
            ),
            Text(
              "Working in progress",
              style: TextStyle(
                color: Colors.yellow[900],
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
