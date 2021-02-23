import 'package:controlegastos/controllers/util.dart';
import 'package:controlegastos/tiles/header.dart';
import 'package:controlegastos/tiles/home_category_tile.dart';
import 'package:controlegastos/tiles/home_main_info_tile.dart';
import 'package:flutter/material.dart';

class HomeDashTab extends StatefulWidget {
  @override
  _HomeDashTabState createState() => _HomeDashTabState();
}

class _HomeDashTabState extends State<HomeDashTab> {
  Color backgroundColor;
  @override
  void initState() {
    super.initState();
    getTheme();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getTheme() {
    Map<String, Color> pallete = getThemeColors();
    backgroundColor = pallete['background'];
  }

  @override
  Widget build(BuildContext context) {
    getTheme();
    return Container(
      color: backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeaderTile(),
            SizedBox(
              height: 200.0,
              child: Column(
                children: [
                  HomeMainInfoTile(),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: getColors(colorName: "white"),
                border: Border.all(
                  color: getColors(colorName: "blue"),
                  width: 2.0,
                ),
              ),
              margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 5.0),
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: Column(
                children: [
                  Text(
                    "Gastos Por Categoria",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: getColors(colorName: "blue"),
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                  Divider(
                    color: getColors(colorName: "blue"),
                    thickness: 2.0,
                    indent: 5.0,
                    endIndent: 5.0,
                  ),
                  SizedBox(
                    height: 100.0,
                    child: Row(
                      children: [
                        HomeCategoryTile(
                          itemIcon: Icons.shopping_basket,
                          isWhite: false,
                          category: "MERCADO",
                        ),
                        HomeCategoryTile(
                          isWhite: false,
                          itemIcon: Icons.fastfood,
                          category: "ALIMENTACAO",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100.0,
                    child: Row(
                      children: [
                        HomeCategoryTile(
                          itemIcon: Icons.directions_bus,
                          isWhite: true,
                          category: "TRANSPORTE",
                        ),
                        HomeCategoryTile(
                          isWhite: true,
                          itemIcon: Icons.receipt,
                          category: "CONTA",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100.0,
                    child: Row(
                      children: [
                        HomeCategoryTile(
                          itemIcon: Icons.school,
                          isWhite: false,
                          category: "EDUCACAO",
                        ),
                        HomeCategoryTile(
                          isWhite: false,
                          itemIcon: Icons.insert_emoticon,
                          category: "LAZER",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100.0,
                    child: Row(
                      children: [
                        HomeCategoryTile(
                          itemIcon: Icons.favorite,
                          isWhite: true,
                          category: "SAUDE",
                        ),
                        HomeCategoryTile(
                          isWhite: true,
                          itemIcon: Icons.scatter_plot,
                          category: "OUTRO",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
