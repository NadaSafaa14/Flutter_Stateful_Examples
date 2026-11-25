import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final dynamic seat;
  final void Function() onTap; 

  const CustomCard({
    super.key, 
    required this.seat, 
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isBooked = seat["status"] == "Booked";

    return InkWell(
      onTap: onTap,
      child: Card(
        color: isBooked ? Colors.deepOrange : Colors.yellow,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${seat["seatNumber"]}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}