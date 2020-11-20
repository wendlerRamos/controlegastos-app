import 'package:controlegastos/controllers/format_number.dart';
import 'package:controlegastos/screens/investments/show_goal_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

GestureDetector buildItemMeta({
  Color backgroundColor,
  Color textColor,
  Map<String, dynamic> data,
  BuildContext context,
}) {
  //data = dataTemp();
  DateFormat formatter = new DateFormat('dd/MM/yyyy');
  int percentage = (100 * data['valor_atual'] / data['valor_meta']).round();
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ShowGoalScreen(
            goalId: data['id'],
          ),
        ),
      );
    },
    child: Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: backgroundColor,
            border: Border.all(
              color: textColor,
              width: 1.0,
            ),
          ),
          margin: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
          child: Padding(
            padding:
                EdgeInsets.only(bottom: 5.0, top: 5.0, left: 5.0, right: 5.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        data['titulo'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'Este mês\n${FormatNumberToMoney.parseNumber(data['valor_atual'])}',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                  ],
                ),
                Divider(
                  color: textColor,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: LinearPercentIndicator(
                        center: Text(
                          "$percentage%",
                          style: TextStyle(
                            color: backgroundColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        animation: true,
                        animationDuration: 1000,
                        lineHeight: 14.0,
                        percent:
                            (percentage < 100) ? (percentage / 100.0) : 1.0,
                        backgroundColor: Colors.grey[400],
                        progressColor: textColor,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Aplicado: ${FormatNumberToMoney.parseNumber(data['valor_atual'])}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Prazo: ${formatter.format(DateTime.parse(data['data_limite']))}",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
