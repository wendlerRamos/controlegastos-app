import 'package:controlegastos/controllers/util.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ShowGoalScreen extends StatefulWidget {
  final int goalId;

  const ShowGoalScreen({Key key, this.goalId}) : super(key: key);
  @override
  _ShowGoalScreenState createState() => _ShowGoalScreenState();
}

class _ShowGoalScreenState extends State<ShowGoalScreen> {
  Color backgroundColor;
  Color borderColor;
  Color textColor;
  Color iconColor;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    backgroundColor = getThemeColors()['background'];
    borderColor = getColors(colorName: "blue");
    textColor = getColors(colorName: "blue");
    iconColor = getColors(colorName: "orange");
  }

  final image = NetworkImage(
      "https://firebasestorage.googleapis.com/v0/b/controledegastos-w.appspot.com/o/teste%2F1561076480162?alt=media&token=c78ec376-a866-4150-962c-baa198ef68ab");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 200.0, 16.0, 16.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16.0),
                        margin: EdgeInsets.only(top: 16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: getColors(colorName: "white"),
                          border: Border.all(
                            color: borderColor,
                            width: 1.0,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "TÍTULO DA META",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: textColor,
                                    ),
                                  ),
                                  ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text(
                                      "Criada em",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: textColor,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "01/01/2000",
                                      style: TextStyle(
                                        color: textColor,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "10.000,00",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: textColor,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      Text(
                                        "Valor da Meta",
                                        style: TextStyle(
                                          color: textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "5.000,00",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: textColor,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      Text(
                                        "Investidos",
                                        style: TextStyle(
                                          color: textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "5.000,00",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: textColor,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      Text(
                                        "Restante",
                                        style: TextStyle(
                                          color: textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: getColors(colorName: "white"),
                      border: Border.all(
                        color: borderColor,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            "Informações da Meta",
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          subtitle: Divider(
                            color: textColor,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                title: Text(
                                  "Prioridade",
                                  style: TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  "8 / 10",
                                  style: TextStyle(
                                    color: textColor,
                                  ),
                                ),
                                leading: Icon(
                                  Icons.priority_high,
                                  color: iconColor,
                                  size: 35.0,
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                title: Text(
                                  "Data Limite",
                                  style: TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  "01/01/2010",
                                  style: TextStyle(
                                    color: textColor,
                                  ),
                                ),
                                leading: Icon(
                                  Icons.calendar_today,
                                  color: iconColor,
                                  size: 35.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ListTile(
                          title: Text(
                            "Percentual atingido",
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: LinearPercentIndicator(
                            center: Text(
                              "50.0%",
                              style: TextStyle(
                                color: getColors(colorName: "white"),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            animation: true,
                            animationDuration: 1000,
                            lineHeight: 14.0,
                            percent: 0.2,
                            backgroundColor: Colors.grey[700],
                            progressColor: getColors(colorName: "blue"),
                          ),
                          leading: Icon(
                            Icons.bubble_chart,
                            color: iconColor,
                            size: 35.0,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "Descrição",
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nulla, illo repellendus quas beatae reprehenderit nemo, debitis explicabo officiis sit aut obcaecati iusto porro? Exercitationem illum consequuntur magnam eveniet delectus ab.",
                            style: TextStyle(
                              color: textColor,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          leading: Icon(
                            Icons.text_fields,
                            color: iconColor,
                            size: 35.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: getColors(colorName: "white"),
                      border: Border.all(
                        color: borderColor,
                        width: 1.0,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                              Text(
                                "\tEditar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                          color: textColor,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RaisedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.archive,
                                color: Colors.white,
                              ),
                              Text(
                                "\tArquivar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                          color: Colors.red[700],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            )
          ],
        ),
      ),
    );
  }
}
