import 'package:weatherchecker/Locationcontroller/locationcontroller.dart';
import 'package:weatherchecker/api/ApiAddress.dart';
import 'package:weatherchecker/api/ApiController.dart';

class MainWeatherModel {
  Future<dynamic> getCityWeather(String name) async {
    var url = '$ApiAddress?q=$name&appid=$Apikey&units=metric';
    ApiController apifetcher = ApiController(url);
    var weatherData = apifetcher.ApiFetcher();
    return weatherData;
  }

  Future<dynamic> getlocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    ApiController networkhelper = ApiController(
        '$ApiAddress?lat=${location.latitude}&lon=${location.longitide}&appid=$Apikey&units=metric');
    var weatherData = await networkhelper.ApiFetcher();
    return weatherData;
  }
}

class descriptionModel {
  final String main;
  final String description;
  descriptionModel({required this.description, required this.main});
}
