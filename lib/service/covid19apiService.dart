import 'dart:convert';
import 'package:home_app/model/covid19api.dart';
import 'package:http/http.dart' as http;

class Covid19apiService {
  static Future<Covid19api> getAll() async {
    var res = await http.get('https://api.covid19api.com/summary');
    if (res.statusCode == 200) {
      var temp = json.decode(res.body);
      return Covid19api.fromJson(temp);
    } else {
      throw Exception('Failed to load Covid19api');
    }
  }
}