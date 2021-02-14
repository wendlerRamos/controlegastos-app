import 'package:cached_network_image/cached_network_image.dart';
import 'package:controlegastos/controllers/format_number.dart';
import 'package:controlegastos/controllers/util.dart';
import 'package:controlegastos/screens/investments/show_goal_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GoalTileWithImage extends StatelessWidget {
  final Map<String, dynamic> itemData;
  final Color textColor;
  final Color backgroundColor;

  const GoalTileWithImage(
      {Key key, this.itemData, this.textColor, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateFormat formatter = new DateFormat('dd/MM/yyyy');

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ShowGoalScreen(
              goalId: itemData['id'],
            ),
          ),
        );
      },
      child: Card(
        color: backgroundColor,
        elevation: 3,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: getColors(colorName: 'white'),
                child: imageContainer(itemData['url_foto']),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemData['titulo'],
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${formatter.format(DateTime.parse(itemData['data_limite']))}",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    priorityItem(double.tryParse(itemData['prioridade'])),
                    Divider(
                      color: textColor,
                      thickness: 2.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${FormatNumberToMoney.parseNumber(itemData['valor_atual'])}",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "\t|\t",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${FormatNumberToMoney.parseNumber(itemData['valor_meta'])}",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container imageContainer(String url) {
    return Container(
      height: 110,
      padding: EdgeInsets.only(left: 0, top: 10, bottom: 70, right: 20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Row priorityItem(double valor) {
    valor = valor / 2;
    List<Widget> stars = [];
    Color startColor = getColors(colorName: "orange");
    for (var i = 0; valor - i > 0; i++) {
      if (valor - i < 1) {
        stars.add(
          Icon(
            Icons.star_half,
            color: startColor,
            size: 18,
          ),
        );
      } else {
        stars.add(
          Icon(
            Icons.star,
            color: startColor,
            size: 18,
          ),
        );
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: stars,
    );
  }
}
