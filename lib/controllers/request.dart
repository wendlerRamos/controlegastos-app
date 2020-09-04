import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api.dart';

Future<Map> getDataFromAPI(String route) async {
    //print(route);
    http.Response response = await Network().getData(route);
    //Check status code
    return json.decode(response.body);
  }