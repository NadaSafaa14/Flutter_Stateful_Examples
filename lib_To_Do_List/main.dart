import 'package:flutter/material.dart';
import 'package:flutter_to_do_list_application/Providers/To_Do_Provider.dart';
import 'package:flutter_to_do_list_application/Views/Home_Screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ToDoProvider())
    ],
    child: MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      title: "To_Do_List",
    ),
    );
  }
}