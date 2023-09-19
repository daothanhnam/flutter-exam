// import http
import 'dart:convert';

import 'package:flutter_practical/welcome.dart';
import 'package:http/http.dart' as http;

class DataServices {
  String baseUrl = "http://10.0.2.2:8080/api/v1/destination";
  Future<List<WelcomeModel>> welcome() async {
    http.Response response = await http.get(Uri.parse(baseUrl + "/welcome"));
    try {
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);
        return list.map((e) => WelcomeModel.fromJson(e)).toList();
      }
    } catch (e) {
      print(e);
    }
    return <WelcomeModel>[];
  }
}
