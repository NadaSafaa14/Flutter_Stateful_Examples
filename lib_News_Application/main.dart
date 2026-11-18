import 'package:flutter/material.dart';
import 'package:flutter_news_application/Providers/Auth_Provider.dart';
import 'package:flutter_news_application/Providers/News_Provider.dart';
import 'package:flutter_news_application/Views/SignUp.dart';
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
        ChangeNotifierProvider(create: (context) => NewsProvider()),
      ],
      child: MaterialApp(
        home: Signup(),
        debugShowCheckedModeBanner: false,
        title: "News App",
      ),
    );
  }
}
