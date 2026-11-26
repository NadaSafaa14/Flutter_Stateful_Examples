import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final book;
  const DetailsScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Details"),
        backgroundColor: Color(0xff123B63),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
          child: Card(
            elevation: 6,
            color: Colors.grey[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.network(
                    book["imageUrl"],
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.image_not_supported_outlined);
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    book["title"],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.person_rounded,
                        color: Color.fromARGB(255, 80, 80, 80),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "Written by : ${book["author"]}",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 80, 80, 80),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    "${book["price"]}\$",
                    style: const TextStyle(fontSize: 20, color: Colors.green),
                  ),
                ),

                Container(height: 1.5, width: 300, color: Colors.grey),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 80, 80, 80),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          book["description"] ?? "",
                          style: TextStyle(
                            color: Color.fromARGB(255, 80, 80, 80),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
