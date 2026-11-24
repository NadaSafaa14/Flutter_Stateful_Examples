import 'package:dio/dio.dart';
import 'package:flutter_quiz_2_wheather_app/Models/WeatherModel.dart';

class Weatherservice {
  static Dio dio = Dio();

  static getWeatherRequest() async {
    try {
      Response response = await dio.get(
        "https://iats.runasp.net/api/Country/GetCountries",
      );

      if (response.statusCode == 200) {
        return Weathermodel.fromJSON(response.data);
      } else {
        throw Exception(
          "Failed to load Wheater (Status code: ${response.statusCode})",
        );
      }
    } on DioException catch (e) {
      throw new Exception("Fetching Error ($e)");
    } catch (other_error) {
      throw Exception(other_error);
    }
  }
}
