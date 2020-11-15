import 'package:controlegastos/controllers/format_number.dart';
import 'package:controlegastos/controllers/request.dart';
import 'package:controlegastos/controllers/util.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:controlegastos/controllers/routes.dart' as Routes;
import 'package:intl/intl.dart';

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

  //var image = NetworkImage("https://firebasestorage.googleapis.com/v0/b/controledegastos-w.appspot.com/o/teste%2F1561076480162?alt=media&token=c78ec376-a866-4150-962c-baa198ef68ab");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: getDataFromAPI(
              "${Routes.getRoute('investments_goal_details')}/${widget.goalId}"),
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
                  return _buildSuccessContent(snapshot.data['result']);
                }
            }
          },
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
        height: 250.0,
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
              color: textColor,
            ),
            Text(
              'Erro de conexão',
              style: TextStyle(
                color: textColor,
              ),
            ),
            Text(
              'Toque para tentar novamente',
              style: TextStyle(
                color: textColor,
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

  Widget _buildProgressIndicator() {
    return Container(
      margin: EdgeInsets.all(4.0),
      height: 250.0,
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
            textColor,
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessContent(Map data) {
    var goal = data['goal'];
    var investments = data['movements'];
    DateFormat formatter = new DateFormat('dd/MM/yyyy');

    return Stack(
      children: <Widget>[
        SizedBox(
          height: 250,
          width: double.infinity,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("${goal['url_foto']}"),
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
                                goal['nome'],
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
                                  formatter.format(
                                      DateTime.parse(goal['created_at'])),
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
                                    FormatNumberToMoney.parseNumber(
                                        double.tryParse(goal['valor_meta'])),
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
                                    FormatNumberToMoney.parseNumber(
                                        goal['valor_total']),
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
                                    FormatNumberToMoney.parseNumber(
                                        goal['valor_restante']),
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
                              "${goal['prioridade']} / 10",
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
                              formatter
                                  .format(DateTime.parse(goal['data_limite'])),
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
                          "${goal['porcentagem'] * 100}%",
                          style: TextStyle(
                            color: getColors(colorName: "white"),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        animation: true,
                        animationDuration: 1000,
                        lineHeight: 14.0,
                        percent: goal['porcentagem'] * 1.0,
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
                        goal['descricao'],
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
    );
  }
}
