import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weathe_model.dart';

class weatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'b2e1255c0d5d4a18be5131134231807';
  Future<weaetherModel?> getWeather({required String cityName}) async {
    weaetherModel? weatherInfo;
    try {
      Uri url =
          Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      http.Response response = await http.get(url);

      Map<String, dynamic> data = jsonDecode(response.body);

      weatherInfo = weaetherModel.fromJson(data);
    } catch (e) {}

    return weatherInfo;
  }
}
