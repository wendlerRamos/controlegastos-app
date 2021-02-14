import 'package:controlegastos/controllers/request.dart';
import 'package:controlegastos/controllers/routes.dart' as Routes;
import 'package:controlegastos/controllers/util.dart';
import 'package:controlegastos/screens/investments/show_locals_screen.dart';
import 'package:controlegastos/tiles/investments/place_tile.dart';
import 'package:flutter/material.dart';

class InvestmentsPlacesBlockTile extends StatefulWidget {
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;

  const InvestmentsPlacesBlockTile(
      {Key key, this.backgroundColor, this.borderColor, this.textColor})
      : super(key: key);

  @override
  _InvestmentsPlacesBlockTileState createState() =>
      _InvestmentsPlacesBlockTileState();
}

class _InvestmentsPlacesBlockTileState
    extends State<InvestmentsPlacesBlockTile> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDataFromAPI(Routes.getRoute('investments_dash_2_places')),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return _buildProgressIndicator();
            break;
          default:
            if (snapshot.hasError ||
                !snapshot.hasData ||
                snapshot.data.containsKey("error")) {
              return _buildErrorContent();
            } else {
              return _buildSuccessContent(context, snapshot.data);
            }
        }
      },
    );
  }

  Widget _buildProgressIndicator() {
    return Container(
      margin: EdgeInsets.all(4.0),
      height: 80.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: widget.backgroundColor,
      ),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            widget.textColor,
          ),
        ),
      ),
    );
  }

  Widget _buildErrorContent() {
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: widget.backgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: 40,
              color: widget.textColor,
            ),
            Text(
              'Erro de conexão',
              style: TextStyle(
                color: widget.textColor,
              ),
            ),
            Text(
              'Toque para tentar novamente',
              style: TextStyle(
                color: widget.textColor,
                fontSize: 12,
              ),
            ),
            Divider(
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessContent(BuildContext context, Map data) {
    List locals = data['locals'];
    int size = locals.length;
    return Container(
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      margin: EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (size > 0)
              ? Expanded(
                  child: buildLocalTile(
                    data: locals[0],
                  ),
                  flex: 1,
                )
              : Container(),
          (size > 0)
              ? SizedBox(
                  width: 25.0,
                )
              : Container(),
          (size > 1)
              ? Expanded(
                  child: buildLocalTile(
                    data: locals[1],
                  ),
                  flex: 1,
                )
              : Container(),
          (size > 1)
              ? SizedBox(
                  width: 25.0,
                )
              : Container(),
          (size > 0)
              ? Expanded(
                  flex: 1,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ShowLocalsScreen(),
                        ),
                      );
                    },
                    color: getColors(colorName: "orange"),
                    child: Container(
                      height: 60.0,
                      padding: EdgeInsets.all(5.0),
                      //margin: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.arrow_forward,
                            color: getColors(colorName: "soft_white"),
                            size: 30.0,
                          ),
                          Text(
                            "Ver Mais",
                            style: TextStyle(
                              color: getColors(
                                colorName: "soft_white",
                              ),
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
