import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherchecker/api/ApiModel.dart';
import 'package:weatherchecker/screens/homeScreen.dart';

class WeatherLoading extends StatefulWidget {
  const WeatherLoading({super.key});

  @override
  State<WeatherLoading> createState() => _WeatherLoadingState();
}

class _WeatherLoadingState extends State<WeatherLoading> {
  void initState() {
    super.initState;
    getLocationData();
  }

  getLocationData() async {
    MainWeatherModel weatherModel = MainWeatherModel();
    var weatherData = await weatherModel.getlocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomeScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitFadingCircle(
        duration: Duration(seconds: 5),
        color: Colors.orange,
      ),
    );
  }
}
