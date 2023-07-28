import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weathe_model.dart';

import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weathe_service.dart';

class searchPage extends StatelessWidget {
  String cityName = '';
  final TextEditingController _searchController = TextEditingController();

  void _onSearchSubmitted(BuildContext context) async {
    cityName = _searchController.text.trim();
    if (cityName.isNotEmpty) {
      weatherService service = weatherService();
      weaetherModel? weather = await service.getWeather(cityName: cityName);
      Provider.of<weatherProvider>(context, listen: false).weatherData =
          weather;
      Provider.of<weatherProvider>(context, listen: false).cityName = cityName;
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
        backgroundColor: const Color.fromARGB(255, 16, 0, 37),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/weather_Images/Home_Screen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (data) {},
                      onSubmitted: (_) => _onSearchSubmitted(context),
                      style: const TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        hintText: 'Enter a City',
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          onPressed: () => _onSearchSubmitted(context),
                          icon: const Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
