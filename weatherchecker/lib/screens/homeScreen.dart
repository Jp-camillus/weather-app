import 'package:flutter/material.dart';
import 'package:weatherchecker/api/ApiController.dart';
import 'package:weatherchecker/api/ApiModel.dart';

import '../api/ApiAddress.dart';

class HomeScreen extends StatefulWidget {
  final locationWeather;
  const HomeScreen({super.key, this.locationWeather});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<descriptionModel> userdata = [];

  int temperature = 90;
  String condition = 'rain';
  int humidity = 20;
  String country = 'Nigeria';
  String name = 'Enugu';
  String description = 'come';

  MainWeatherModel weatherModel = MainWeatherModel();
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weather) {
    setState(
      () {
        if (weather == null) {
          temperature = 0;
          humidity = 0;
          country = '';
          name = '';
          return;
        }

        condition = weather['weather'][0]['main'];
        humidity = weather['main']['humidity'];
        country = weather['sys']['country'];
        name = weather['name'];
        double temp = weather['main']['temp'];
        temperature = temp.toInt();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height.round();
    var w = MediaQuery.of(context).size.width.round();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: h.toDouble(),
          width: w.toDouble(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      'asset/images/tom-barrett-hgGplX3PFBg-unsplash.jpg'))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: h * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Weather',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Icon(
                      Icons.sunny,
                      color: Colors.orange,
                    )
                  ],
                ),
                Text(
                  'Location:',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  country,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
                SizedBox(
                  height: h * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () async {
                          var weatherData =
                              await weatherModel.getCityWeather(name);
                          updateUI(weatherData);
                        },
                        icon: Icon(
                          Icons.update,
                          color: Colors.white,
                        )),
                    Center(
                      child: Container(
                        width: w * 0.6,
                        child: TextField(
                          onChanged: (value) {
                            name = value;
                          },
                          enableSuggestions: true,
                          decoration: InputDecoration(
                            hintText: 'search location',
                            filled: true,
                            fillColor: Colors.white,
                            focusColor: Colors.orange,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.orange)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (name != null) {
                            var weatherData =
                                await weatherModel.getCityWeather(name);
                            updateUI(weatherData);
                          }
                        },
                        child: Text('search'))
                  ],
                ),
                SizedBox(
                  height: h * 0.05,
                ),
                Row(
                  children: [
                    Text(
                      'Temperature:  ',
                      style: TextStyle(
                          fontSize: h * 0.03,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      '${temperature}°',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: h * 0.08,
                          color: Colors.white),
                    ),
                    Image(
                        height: h * 0.1,
                        image: AssetImage('asset/images/sky.png'))
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'condition:  ',
                      style: TextStyle(
                          fontSize: h * 0.03,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      condition,
                      style: TextStyle(
                          fontSize: h * 0.03,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'humidity: ',
                      style: TextStyle(
                          fontSize: h * 0.03,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      humidity.toString(),
                      style: TextStyle(
                          fontSize: h * 0.03,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Country: ',
                      style: TextStyle(
                          fontSize: h * 0.03,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      country,
                      style: TextStyle(
                          fontSize: h * 0.03,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'name:  ',
                      style: TextStyle(
                          fontSize: h * 0.03,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: h * 0.03,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
