class weaetherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  weaetherModel(
      {required this.temp,
      required this.date,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  //factory conustractor
  factory weaetherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    print(jsonData);
    return weaetherModel(
        temp: jsonData['avgtemp_c'],
        date: data['location']['localtime'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }
  @override
  String toString() {
    return 'temp: $temp | max: $maxTemp | min: $maxTemp | date: $date';
  }

  String getImage() {
    if (weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder') {
      return 'assets/img/storm.png';
    } else if (weatherStateName == 'Clear' ||
        weatherStateName == 'Light cloud') {
      return 'assets/img/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'assets/img/Sleet.png';
    } else if (weatherStateName == 'Heavy cloud' ||
        weatherStateName == 'Partly cloudy') {
      return 'assets/img/Heavy cloud.png';
    } else if (weatherStateName == 'Light rain' ||
        weatherStateName == 'Heavy rain' ||
        weatherStateName == 'Showers' ||
        weatherStateName == 'Patchy rain possible') {
      return 'assets/img/Light rain.png';
    } else if (weatherStateName == 'Sunny') {
      return 'assets/img/sun.png';
    } else {
      return 'assets/img/Cloudy.png';
    }
  }
}
