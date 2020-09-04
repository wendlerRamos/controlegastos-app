import 'package:controlegastos/controllers/util.dart';
import 'package:controlegastos/screens/home/add_movimentation_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MovimentationTile extends StatefulWidget {
  final bool themeWhite;
  final String category;
  final cardInfo;

  const MovimentationTile(
      {Key key,
      this.themeWhite = false,
      this.category = "OUTRO",
      this.cardInfo})
      : super(key: key);

  @override
  _MovimentationTileState createState() => _MovimentationTileState();
}

class _MovimentationTileState extends State<MovimentationTile> {
  Color backgroundColor = getColors(colorName: "blue");
  Color iconColor = getColors(colorName: "green");
  Color textColor = getColors(colorName: "soft_white");
  Color borderColor = getColors(colorName: "soft_white");
  final numberFormat =
      NumberFormat.currency(locale: "pt_BR", name: "R\$", decimalDigits: 2);

  @override
  Widget build(BuildContext context) {
    if (widget.cardInfo['tipo'] == "DESPESA") {
      iconColor = getColors(colorName: "orange");
    }
    DateFormat formatter = new DateFormat('dd/MM/yyyy');
    if (widget.themeWhite) {
      backgroundColor = getColors(colorName: "white");
      textColor = getColors(colorName: "blue");
      borderColor = getColors(colorName: "blue");
    }
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AddMovimentationScreen(
              data: widget.cardInfo,
            ),
          ),
        );
      },
      child: Column(
        children: <Widget>[
          Container(
            height: 50.0,
            padding:
                EdgeInsets.only(bottom: 5.0, top: 5.0, left: 5.0, right: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: borderColor,
              ),
              color: backgroundColor,
            ),
            margin:
                EdgeInsets.only(bottom: 10.0, top: 5.0, left: 5.0, right: 5.0),
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Icon(
                      returnIconByCategory(widget.cardInfo['descricao']),
                      color: iconColor,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                      numberFormat.format(double.parse(widget.cardInfo['valor'])),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                      formatter.format(DateTime.parse(widget.cardInfo['data'])),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
