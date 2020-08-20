import 'package:controlegastos/controllers/util.dart';
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
    // TODO: implement dispose
    super.dispose();
  }

  void getTheme() {
    Map<String, Color> pallete = getThemeColors();
    backgroundColor = pallete['background'];
    print("Updating Theme");
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
            _buildHeader(),
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
                      fontSize: 30.0,
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
                        ),
                        HomeCategoryTile(
                          isWhite: false,
                          itemIcon: Icons.fastfood,
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
                        ),
                        HomeCategoryTile(
                          isWhite: true,
                          itemIcon: Icons.receipt,
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
                        ),
                        HomeCategoryTile(
                          isWhite: false,
                          itemIcon: Icons.insert_emoticon,
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
                        ),
                        HomeCategoryTile(
                          isWhite: true,
                          itemIcon: Icons.scatter_plot,
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

  Container _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        color: getColors(colorName: "blue"),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: Text(
              "Wendler Ramos",
              style: TextStyle(
                  color: getColors(colorName: "white"),
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
            ),
            trailing: Text(
              "01/01/2020",
              style: TextStyle(
                  color: getColors(colorName: "white"),
                  fontWeight: FontWeight.bold,
                  fontSize: 10.0),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
