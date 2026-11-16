import 'package:flutter/material.dart';
import 'package:flutter_application_dio_random_user/Providers/random_user_provider.dart';
import 'package:flutter_application_dio_random_user/Views/Home_Screen.dart';
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
        ChangeNotifierProvider(create: (context) => RandomUserProvider()),
      ],
      child: MaterialApp(
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
        title: "Random User dio Project",
      ),
    );
  }
}
