import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weathe_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // void updateUi() {
  //   setState(() {});
  // }

  weaetherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData =
        Provider.of<weatherProvider>(context, listen: true).weatherData;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 16, 0, 37),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return searchPage(
                    // updateUi: updateUi,
                    );
              }));
            },
            icon: const Icon(Icons.search),
            iconSize: 29,
          ),
        ],
        title: const Text('Weather App'),
      ),
      body: weatherData == null
          ? Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/weather_Images/Home_Screen.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.srgbToLinearGamma(),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'there is no weather 😔',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'start searching now 🔍',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            )
          : Container(
              color: const Color.fromARGB(255, 16, 0, 37),
              child: Column(
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    Provider.of<weatherProvider>(context).cityName!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 49,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Updated: ${weatherData!.date}',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        weatherData!.getImage(),
                        width: 110,
                        height: 160,
                      ),
                      Column(
                        children: [
                          Text(
                            '${weatherData!.temp.toInt()}°C',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 42,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Max Temp: ${weatherData!.maxTemp.toInt()}°C',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Min Temp: ${weatherData!.minTemp.toInt()}°C',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    weatherData?.weatherStateName ?? '',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                ],
              ),
            ),
    );
  }
}
