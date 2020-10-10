import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api.dart';

Future<Map> getDataFromAPI(String route) async {
    http.Response response = await Network().getData(route);
    if(response.statusCode != 200){
      throw Error();
    }
    return json.decode(response.body);
  }