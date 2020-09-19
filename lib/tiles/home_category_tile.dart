import 'package:controlegastos/controllers/request.dart';
import 'package:controlegastos/controllers/util.dart';
import 'package:controlegastos/screens/home/show_category_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:controlegastos/controllers/routes.dart' as Routes;
import 'package:intl/intl.dart';

class 
HomeCategoryTile extends StatefulWidget {
  final bool isWhite;
  final IconData itemIcon;
  final String category;

  const HomeCategoryTile(
      {Key key,
      this.isWhite = true,
      this.itemIcon = Icons.error,
      this.category})
      : super(key: key);

  @override
  _HomeCategoryTileState createState() => _HomeCategoryTileState();
}

class _HomeCategoryTileState extends State<HomeCategoryTile> {
  Color backgroundColor;
  Color contentColor;
  Color spotlightColor;
  Color borderColor;
  final numberFormat =
      NumberFormat.currency(locale: "pt_BR", name: "R\$", decimalDigits: 2);
  @override
  void initState() {
    super.initState();
    
    if (widget.isWhite) {
      backgroundColor = getColors(colorName: "white");
      contentColor = getColors(colorName: "blue");
      borderColor = getColors(colorName: "blue");
    } else {
      backgroundColor = getColors(colorName: "blue");
      contentColor = getColors(colorName: "soft_white");
      borderColor = getColors(colorName: "soft_white");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDataFromAPI(
          Routes.getRoute('home_dash_category_resume') + "${widget.category}"),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Expanded(
              child: Container(
                margin: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: backgroundColor,
                  border: Border.all(
                    color: borderColor,
                    width: 2.0,
                  ),
                ),
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      contentColor,
                    ),
                  ),
                ),
              ),
            );
            break;
          default:
            if (snapshot.hasError || !snapshot.hasData || snapshot.data.containsKey("error")) {
              return _buildErrorContent();
            } else {
              return _buildContent(context, snapshot.data);
            }
        }
      },
    );
  }

  Widget _buildErrorContent() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {});
        },
        child: Container(
          margin: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: backgroundColor,
            border: Border.all(
              color: borderColor,
              width: 2.0,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
                size: 40,
                color: contentColor,
              ),
              Text(
                'Erro de conexão',
                style: TextStyle(
                  color: contentColor,
                ),
              ),
              Text(
                'Toque para tentar novamente',
                style: TextStyle(
                  color: contentColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, Map data) {
    data = data['resumo'];
    int percentMedia;
    String percentMediaLabel = "-";
    data['valor_media'] = double.parse(data['valor_media']);
    data['valor'] = double.parse(data['valor']);
    if (data['valor_media'] == 0) {
      percentMedia = 0;
    } else {
      percentMedia = ((data['valor'] / data['valor_media']) * 100).abs().floor();
      percentMediaLabel = percentMedia.toString();
    }
    Color colorPercentLabel;
    if (percentMedia > 100) {
      colorPercentLabel = getColors(colorName: "orange");
    } else {
      colorPercentLabel = getColors(colorName: "green");
    }
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ShowCategoryScreen(
                category: widget.category,
              ),
            ),
          );
        },
        onLongPress: () {
          setState(() {});
        },
        child: Container(
          margin: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: backgroundColor,
            border: Border.all(
              color: borderColor,
              width: 2.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Icon(
                    widget.itemIcon,
                    size: 60.0,
                    color: contentColor,
                  ),
                  flex: 1,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        numberFormat.format(data['valor']),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: (data['valor'] < 1000)?30.0:20.0,
                          color: contentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "$percentMediaLabel% da média",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: colorPercentLabel,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
