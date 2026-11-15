import 'package:flutter/material.dart';
import 'package:flutter_application_dio_intro/Models/prayer_time_model.dart';
import 'package:flutter_application_dio_intro/Services/prayer_time_Service.dart';

class PrayerTimeProvider extends ChangeNotifier
{
  PrayerTimeModel? prayerTimeModel ;

  getPrayerTimeData() async
  {
    prayerTimeModel = await PrayerTimeService.getPrayerTime();
    notifyListeners();
  }
}