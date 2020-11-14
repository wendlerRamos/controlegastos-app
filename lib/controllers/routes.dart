import 'dart:convert';

import 'package:flutter/material.dart';

import 'api.dart';

//const host = "http://192.168.0.12:8000";
const host = "https://controledegastos.herokuapp.com";
const ROUTES = {
  "teste": "/api/v1/teste",
  "movimentations_list": "$host/teste/movs",
  "home_dash_main_info": "/api/v1/movimentations/get_resume",
  "home_dash_main_info_details": "/api/v1/movimentations/get_movimentations/",
  "home_dash_category_resume": "/api/v1/movimentations/category/",
  "home_dash_category_infos": "/api/v1/movimentations/category_details/",
  "investments_dash_resume": "/api/v1/investments/get_resume",
  "investments_dash_chart_by_month": "/api/v1/investments/economies_historic",
  "investments_dash_2_goals": "/api/v1/investments/goals/get_top_2",
  "investments_dash_2_places": "/api/v1/investments/places/get_top_2",
  "investments_movements": "/api/v1/investments/movements",
};

String getRoute(String routeName) {
  //print(ROUTES);
  return ROUTES[routeName];
}

Future<bool> checkIfTokenIsValid() async {
  var res = await Network().getData('/api/v1/test');
  var body = json.decode(res.body);
  if (body.containsKey('error') && body['error'] == "Unauthenticated") {
    return false;
  } else {
    return true;
  }
}

class ScaleRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          ),
        );
}

class SizeRoute extends PageRouteBuilder {
  final Widget page;
  SizeRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Align(
            child: SizeTransition(
              sizeFactor: animation,
              child: child,
            ),
          ),
        );
}
