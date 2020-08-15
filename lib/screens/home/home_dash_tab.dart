import 'package:controlegastos/controllers/util.dart';
import 'package:controlegastos/tiles/home_category_tile.dart';
import 'package:controlegastos/tiles/home_main_info_tile.dart';
import 'package:flutter/material.dart';

class HomeDashTab extends StatefulWidget {
  @override
  _HomeDashTabState createState() => _HomeDashTabState();
}

class _HomeDashTabState extends State<HomeDashTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
