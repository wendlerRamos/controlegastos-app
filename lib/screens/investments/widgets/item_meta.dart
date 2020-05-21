import 'package:flutter/material.dart';

GestureDetector buildItemMeta(
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
                color: Colors.black,
              )));
    },
    child: Column(
      children: <Widget>[
        Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                        Expanded(child: Text('Nome aleatório de meta', textAlign: TextAlign.center, style: TextStyle(
                        color: Color.fromARGB(255, 3, 40, 80), fontSize: 20.0, fontWeight: FontWeight.bold
                      ),),),
                      Text('Este mês\n+25,00', style: TextStyle( color: Colors.green, fontSize: 10.0, fontWeight: FontWeight.bold),),
                      SizedBox(width: 5.0,)
                      ],
                  ),
                  Divider(color: Color.fromARGB(255, 3, 40, 80),),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 5.0,),
                      Expanded(
                        child:
                          Text(
                          "Progresso: 75%",
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Color.fromARGB(255, 3, 40, 80), fontWeight: FontWeight.bold),
                        ),),
                      Expanded(
                        child: Text(
                          "Aplicado: 1.500,00",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color.fromARGB(255, 3, 40, 80), fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                          child: Text(
                        "Prazo: 01/01/2020",
                        textAlign: TextAlign.end,
                        style: TextStyle(color: Color.fromARGB(255, 3, 40, 80), fontWeight: FontWeight.bold),
                      )),
                      SizedBox(width: 5.0,)
                    ],
                  ),
                ],
              ),
            )),
        /*
        Divider(
          color: Colors.white,
        ),
        */
      ],
    ),
  );
}
