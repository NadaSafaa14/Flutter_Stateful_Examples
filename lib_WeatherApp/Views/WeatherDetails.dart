import 'package:flutter/material.dart';
import 'package:flutter_quiz_2_wheather_app/Widgets/CustomDetailsCard.dart';

class Weatherdetails extends StatelessWidget {
  dynamic country;
  Weatherdetails({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    final String name = country["name"];
    final String weatherImageUrl = country["weatherImageUrl"];
    final String weatherCondition = country["weatherCondition"];
    final String tempreature = country["tempreature"];

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: CustomDetailsCard(
          name: name,
          tempreature: tempreature,
          weatherCondition: weatherCondition,
          weatherImageUrl: weatherImageUrl,
        ),
      ),
    );
  }
}
