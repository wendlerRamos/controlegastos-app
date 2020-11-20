import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api.dart';

Future<Map> getDataFromAPI(String route) async {
  http.Response response = await Network().getData(route);
  if (response.statusCode != 200) {
    throw Error();
  }
  return json.decode(response.body);
}

Future<Map> postDataFromAPI(String route, Map data) async {
  http.Response response = await Network().postData(route, data);
  if (response.statusCode != 200) {
    throw Exception();
  }
  return json.decode(response.body);
}

Future<Map> putDataFromAPI(String route, Map data) async {
  http.Response response = await Network().putData(route, data);
  if (response.statusCode != 200) {
    throw Error();
  }
  return json.decode(response.body);
}
