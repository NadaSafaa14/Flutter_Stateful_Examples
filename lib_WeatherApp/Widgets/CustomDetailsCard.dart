import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomDetailsCard extends StatelessWidget {
  String name;
  String weatherImageUrl;
  String weatherCondition;
  String tempreature;

  CustomDetailsCard({
    super.key,
    required this.name,
    required this.tempreature,
    required this.weatherCondition,
    required this.weatherImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 400,
        width: 340,
        child: Card(
          elevation: 25,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(weatherImageUrl),
                maxRadius: 80,
              ),
              SizedBox(height: 20),
              Text(name, style: TextStyle(fontSize: 30)),
              SizedBox(height: 10),
              Text(
                "Weather : $weatherCondition",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                "Temperature : $tempreature°C",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
