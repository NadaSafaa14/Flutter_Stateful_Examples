import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomNewsCard extends StatelessWidget {
  String title;
  String? description;
  String? photoURL;

  CustomNewsCard({
    super.key,
    required this.title,
    this.description,
    this.photoURL,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
      child: Container(
        height: 400,
        child: Card(
          elevation: 6,
          color: Colors.purple[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  photoURL ?? "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg",
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title, style: TextStyle(fontSize: 18)),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    description ?? "",
                    style: TextStyle(color: Colors.grey[800], fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
