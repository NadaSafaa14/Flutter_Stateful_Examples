import 'package:flutter/material.dart';
import 'package:flutter_application_dio_intro/Providers/prayer_time_provider.dart';
import 'package:flutter_application_dio_intro/Views/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => PrayerTimeProvider(),)],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      
        title: "Dio Intro Flutter Project",
      ),
    );
  }
}

