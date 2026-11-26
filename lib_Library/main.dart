import 'package:flutter/material.dart';
import 'package:flutter_library_application/Providers/Auth_Provider.dart';
import 'package:flutter_library_application/Providers/Library_Provider.dart';
import 'package:flutter_library_application/Views/Home_Screen.dart';
import 'package:flutter_library_application/Views/Register_Screen.dart';
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
        ChangeNotifierProvider(create: (context) => LibraryProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Library_App",
        home: RegisterScreen(),
      ),
    );
  }
}
