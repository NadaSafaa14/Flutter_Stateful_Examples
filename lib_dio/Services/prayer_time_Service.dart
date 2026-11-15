import 'package:dio/dio.dart';
import 'package:flutter_application_dio_intro/Models/prayer_time_model.dart';

class PrayerTimeService {
  static Dio dio = Dio();

  static Future<PrayerTimeModel> getPrayerTime() async {
    try {
      Response response = await dio.get(
        "https://api.aladhan.com/v1/timingsByCity/15-11-2026?city=Giza&country=Egypt&method=2",
      );

      if (response.statusCode == 200) {
        return PrayerTimeModel.fromJSON(response.data);
      } else {
        throw Exception(
          'Failed to load prayer times (Status code: ${response.statusCode})',
        );
      }
    } on DioException catch (e) {
      throw Exception('Error fetching prayer times: $e');
    } catch (other_Error) {
      throw Exception(other_Error);
    }
  }
}
