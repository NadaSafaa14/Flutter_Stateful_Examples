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
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          leading: CircleAvatar(backgroundImage: NetworkImage(photoURL)),
        ),
      ),
    );
  }
}
