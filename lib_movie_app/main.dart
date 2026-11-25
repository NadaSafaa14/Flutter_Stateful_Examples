import 'package:flutter/material.dart';
import 'package:flutter_movie_application/Providers/Movies_Provider.dart';
import 'package:flutter_movie_application/Views/Home_Screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => MoviesProvider())
    ],
    child: MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      title: "Movies_App",
    ),
    );
  }
}