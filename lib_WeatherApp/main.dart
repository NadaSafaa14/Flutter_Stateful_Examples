import 'package:flutter/material.dart';
import 'package:flutter_quiz_2_wheather_app/Providers/AuthProvider.dart';
import 'package:flutter_quiz_2_wheather_app/Providers/WeatherProvider.dart';
import 'package:flutter_quiz_2_wheather_app/Views/SignUp.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => Wheatherprovider()),
      ],
      child: MaterialApp(
        home: Signup(),
        debugShowCheckedModeBanner: false,
        title: "Weather App",
      ),
    );
  }
}
