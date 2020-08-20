import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map> getDataFromAPI(String route) async {
    //print(route);
    http.Response response = await http.get(route);
    //Check status code
    return json.decode(response.body);
  }