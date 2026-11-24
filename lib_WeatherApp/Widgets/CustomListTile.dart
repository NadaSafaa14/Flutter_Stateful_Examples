import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  String title;
  String subtitle;
  String photoURL;

  CustomListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.photoURL,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 15,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            title: Text(title),
            subtitle: Text("$subtitle°C"),
            leading: Image.network(photoURL),
          ),
        ),
      ),
    );
  }
}
