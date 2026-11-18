import 'package:flutter/material.dart';

class CustomNewsDetailsCard extends StatelessWidget {
  final String title;
  final String? description;
  final String? photoURL;
  final String? content;
  final String? publishedAt;
  final String? author;

  const CustomNewsDetailsCard({
    super.key,
    required this.title,
    this.description,
    this.photoURL,
    this.author,
    this.content,
    this.publishedAt,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
        child: Card(
          elevation: 6,
          color: Colors.purple[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  photoURL ?? "https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg",
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(width: 8),
                    Text(
                      author ?? "Unknown Author",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 82, 82, 82),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_month),
                    const SizedBox(width: 8),
                    Text(
                      publishedAt ?? "",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 82, 82, 82),
                      ),
                    ),
                  ],
                ),
              ),

              Container(height: 1.5, width: 300, color: Colors.grey),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("Description", style: TextStyle(fontSize: 18)),
                    SizedBox(height: 4),
                    Text(
                      description ?? "",
                      style: TextStyle(color: Colors.grey[800], fontSize: 14),
                    ),
                  ],
                ),
              ),

              Container(height: 1.5, width: 300, color: Colors.grey),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("Content", style: TextStyle(fontSize: 18)),
                    SizedBox(height: 4),
                    Text(
                      content ?? "",
                      style: TextStyle(color: Colors.grey[800], fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
