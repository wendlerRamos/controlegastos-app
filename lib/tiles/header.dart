import 'package:controlegastos/controllers/util.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class HeaderTile extends StatefulWidget {
  @override
  _HeaderTileState createState() => _HeaderTileState();
}

class _HeaderTileState extends State<HeaderTile> {
  @override
  Widget build(BuildContext context) {
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
          FutureBuilder(
            future: getUser(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  {
                    return buildLoadingHeader();
                  }
                default:
                  {
                    return buildLoadedHeader(snapshot.data['nome'], snapshot.data['ultimo_acesso']);
                  }
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }

  Future<Map<String, dynamic>> getUserToHeader() async {
    var user;
    await getUser().then((value) => user = value);
    return user;
  }

  ListTile buildLoadedHeader(String userName, String lastAccess) {
    DateFormat formatter = new DateFormat('dd/MM/yyyy');
    return ListTile(
      title: Text(
        userName,
        style: TextStyle(
            color: getColors(colorName: "white"),
            fontWeight: FontWeight.bold,
            fontSize: 15.0),
      ),
      trailing: Text(
        '${formatter.format(DateTime.parse(lastAccess))}',
        style: TextStyle(
            color: getColors(colorName: "white"),
            fontWeight: FontWeight.bold,
            fontSize: 10.0),
        textAlign: TextAlign.end,
      ),
    );
  }

  ListTile buildLoadingHeader() {
    Color colorA = Color.fromARGB(255, 3, 50, 100);
    Color colorB = getColors(colorName: "blue");
    return ListTile(
      title: Shimmer.fromColors(
        baseColor: colorA,
        highlightColor: colorB,
        child: Container(
          height: 15.0,
          color: getColors(colorName: "white"),
        ),
      ),
      trailing: Shimmer.fromColors(
        baseColor: colorA,
        highlightColor: colorB,
        child: Container(
          height: 15.0,
          width: 40.0,
          color: getColors(colorName: "white"),
        ),
      ),
    );
  }
}
