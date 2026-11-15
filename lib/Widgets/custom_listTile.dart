import 'package:flutter/material.dart';

class CustomListtile extends StatelessWidget {
  String title;
  String subtitle;
  CustomListtile({super.key, required this.subtitle, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(96, 255, 128, 170),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          leading: Icon(Icons.alarm),
        ),
      ),
    );
  }
}
