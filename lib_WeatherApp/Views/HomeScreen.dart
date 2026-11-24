import 'package:flutter/material.dart';
import 'package:flutter_quiz_2_wheather_app/Providers/WeatherProvider.dart';
import 'package:flutter_quiz_2_wheather_app/Views/WeatherDetails.dart';
import 'package:flutter_quiz_2_wheather_app/Widgets/CustomListTile.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Consumer<Wheatherprovider>(
        builder: (context, value, child) {
          if (value.wheathermodel == null) {
            value.getWeatherRequestData();
            return Center(
              child: CircularProgressIndicator(color: Colors.deepOrange),
            );
          }
          return ListView.builder(
            itemCount: value.wheathermodel!.country.length,
            itemBuilder: (context, index) {
              final country = value.wheathermodel!.country[index];

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Weatherdetails(country: country),
                    ),
                  );
                },
                child: CustomListTile(
                  title: country["name"],
                  subtitle: country["tempreature"],
                  photoURL: country["countryImageUrl"],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
