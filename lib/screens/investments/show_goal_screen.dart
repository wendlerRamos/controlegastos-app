import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ShowGoalScreen extends StatefulWidget {
  final int goalId;

  const ShowGoalScreen({Key key, this.goalId}) : super(key: key);
  @override
  _ShowGoalScreenState createState() => _ShowGoalScreenState();
}

class _ShowGoalScreenState extends State<ShowGoalScreen> {
  final image = NetworkImage(
      "https://firebasestorage.googleapis.com/v0/b/controledegastos-w.appspot.com/o/teste%2F1561076480162?alt=media&token=c78ec376-a866-4150-962c-baa198ef68ab");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SizedBox(
                height: 250,
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(image: image, fit: BoxFit.cover)),
                )),
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
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
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
                                    style: Theme.of(context).textTheme.headline6,
                                  ),
                                  ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text("Criada em"),
                                    subtitle: Text("01/01/2000"),
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
                                      Text("10.000,00", style: TextStyle(fontWeight: FontWeight.bold),),
                                      Text("Valor da Meta")
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text("5.000,00", style: TextStyle(fontWeight: FontWeight.bold),),
                                      Text("Investidos")
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text("5.000,00", style: TextStyle(fontWeight: FontWeight.bold),),
                                      Text("Restante")
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text("Informações da Meta"),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("Prioridade"),
                          subtitle: Text("8 / 10"),
                          leading: Icon(Icons.priority_high),
                        ),
                        ListTile(
                          title: Text("Percentual atingido"),
                          subtitle: LinearPercentIndicator(
                            //width: 140.0,
                            center: Text("50.0%"),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            animation: true,
                            animationDuration: 1000,
                            lineHeight: 14.0,
                            percent: 0.5,
                            backgroundColor: Colors.grey[400],
                            progressColor: Colors.blue,
                          ),
                          leading: Icon(Icons.bubble_chart),
                        ),
                        ListTile(
                          title: Text("Data Limite"),
                          subtitle: Text("01/01/2010"),
                          leading: Icon(Icons.calendar_today),
                        ),
                        ListTile(
                          title: Text("Descrição"),
                          subtitle: Text(
                              "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nulla, illo repellendus quas beatae reprehenderit nemo, debitis explicabo officiis sit aut obcaecati iusto porro? Exercitationem illum consequuntur magnam eveniet delectus ab."),
                          leading: Icon(Icons.text_fields),
                        ),
                        ListTile(
                          title: Text("Ações"),
                          subtitle: Row(
                            children: <Widget>[
                              RaisedButton(onPressed: (){}, child: Icon(Icons.edit, color: Colors.white,),color: Colors.lightBlue,),
                              SizedBox(width: 10.0,),
                              RaisedButton(onPressed: (){}, child: Icon(Icons.archive, color: Colors.white), color: Colors.redAccent,),
                            ],
                          ),
                          leading: Icon(Icons.settings_applications),
                        ),
                      ],
                    ),
                  )
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