import 'package:flutter/material.dart';
import 'package:flutter_movie_application/Providers/Movies_Provider.dart';
import 'package:provider/provider.dart';

class UpdateCancelPage extends StatelessWidget {
  final dynamic seat;

  const UpdateCancelPage({super.key, required this.seat});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController(
      text: seat["customerName"] ?? "",
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        title: Text("Manage Seat ${seat["seatNumber"]}"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Booking ID: #${seat["bookingId"]}",
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
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                if (nameController.text.trim().isNotEmpty) {
                  Provider.of<MoviesProvider>(context, listen: false)
                      .updateBookingRequest(
                    id: seat["bookingId"],
                    CustomerName: nameController.text.trim(),
                  );
                  Navigator.pop(context);
                }
              },
              child: const Text(
                "Update Booking",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Provider.of<MoviesProvider>(context, listen: false)
                    .deleteBookingRequest(id: seat["bookingId"]);
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel Booking",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}