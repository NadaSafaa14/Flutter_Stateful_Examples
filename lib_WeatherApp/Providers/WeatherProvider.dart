import 'package:flutter/material.dart';
import 'package:flutter_quiz_2_wheather_app/Models/WeatherModel.dart';
import 'package:flutter_quiz_2_wheather_app/Services/WeatherService.dart';

class Wheatherprovider extends ChangeNotifier {
  Weathermodel? wheathermodel;

  getWeatherRequestData() async {
    wheathermodel = await Weatherservice.getWeatherRequest();
    notifyListeners();
  }
}
