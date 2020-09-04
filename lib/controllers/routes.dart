import 'package:flutter/material.dart';

const host = "http://192.168.0.12:8000";
//const host = "https://controledegastos.herokuapp.com";
const ROUTES = {
  "teste": "https://www.google.com",
  "main_dash_data": "$host/teste",
  "movimentations_list": "$host/teste/movs",
  "home_dash_main_info": "/api/v1/movimentations/get_resume",
  "home_dash_main_info_details": "/api/v1/movimentations/get_movimentations/",
  "home_dash_category_resume": "/api/v1/movimentations/category/",
  "home_dash_category_infos": "/api/v1/movimentations/category_details/",
};

String getRoute(String routeName) {
  //print(ROUTES);
  return ROUTES[routeName];
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
