import 'package:flutter/material.dart';
import 'package:flutter_movie_application/Providers/Movies_Provider.dart';
import 'package:provider/provider.dart';

class BookSeatPage extends StatelessWidget {
  final dynamic seat;
  final dynamic movie;

  const BookSeatPage({super.key, required this.seat, required this.movie});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        title: Text("Book Seat ${seat["seatNumber"]}"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Movie: ${movie["name"]}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Seat Number: ${seat["seatNumber"]}",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Customer Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  Provider.of<MoviesProvider>(
                    context,
                    listen: false,
                  ).addBookingRequest(
                    CustomerName: nameController.text.trim(),
                    seatId: seat["seatId"],
                    movieId: movie["id"],
                  );

                  Navigator.pop(context);
                }
              },
              child: const Text(
                "Confirm Booking",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
