import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherchecker/api/ApiAddress.dart';
import 'package:weatherchecker/api/ApiModel.dart';

class ApiController {
  MainWeatherModel weatherModel = MainWeatherModel();
  final String url;
  ApiController(this.url);
  Future ApiFetcher() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      print(response.statusCode);
      print(data);

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}

class APIcontroller {
  Future<void> apiloader() async {}
}
