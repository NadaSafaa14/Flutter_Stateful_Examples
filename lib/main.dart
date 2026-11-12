import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:third_week_flutter/View/Provider/Shopping_Provider.dart';
import 'package:third_week_flutter/View/Provider/TextFieldProvider.dart';
import 'package:third_week_flutter/View/Provider_Test.dart';
import 'package:third_week_flutter/View/shopping_Stateful_Test.dart';
import 'package:third_week_flutter/View/stateful_test_follow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShoppingProvider(),
      // create: (context) => TextFieldProvider(),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: StatefulTestFollow(),
        home: ShoppingStatefulTest(),
        // home: ProviderTest(),

        title: "First Flutter Project",
      ),
    );
  }
}
