import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  String name;
  String poster;
  String showDate;
  String showTime;

  CustomListTile({
    super.key,
    required this.name,
    required this.poster,
    required this.showDate,
    required this.showTime,
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
            title: Text(name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: Colors.deepOrange,
                      size: 15,
                    ),
                    Text("  $showDate"),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.alarm_rounded,
                      color: Colors.deepOrange,
                      size: 15,
                    ),
                    Text("  $showTime"),
                  ],
                ),
              ],
            ),
            leading: Image.network(
              poster,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.image_not_supported_outlined);
              },
            ),
          ),
        ),
      ),
    );
  }
}
