import 'package:flutter/material.dart';
import 'package:weather_app/models/weathe_model.dart';

class weatherProvider extends ChangeNotifier {
  weaetherModel? _weatherData;
  String? cityName;
  set weatherData(weaetherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  weaetherModel? get weatherData => _weatherData;
}
