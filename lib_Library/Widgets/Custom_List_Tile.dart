import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  String title;
  String imageUrl;
  num price;
  num rate;

  CustomListTile({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.rate,
    required this.price,
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
            subtitle: Text("$price\$"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.star_rounded, color: Colors.yellow),
                Text(" $rate"),
              ],
            ),
            leading: Image.network(
              imageUrl,
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
