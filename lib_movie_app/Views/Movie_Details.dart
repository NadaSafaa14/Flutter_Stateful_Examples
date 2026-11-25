import 'package:flutter/material.dart';
import 'package:flutter_movie_application/Providers/Movies_Provider.dart';
import 'package:flutter_movie_application/Views/Book_Seat.dart';
import 'package:flutter_movie_application/Views/Update_Cancel_Seat.dart';
import 'package:flutter_movie_application/Widgets/Custom_Card.dart';
import 'package:flutter_movie_application/Widgets/Custom_List_Tile.dart';
import 'package:provider/provider.dart';

class MovieDetails extends StatelessWidget {
  final dynamic movie; 
  const MovieDetails({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesProvider>(
      builder: (context, moviesProvider, child) {
        
        var updatedMovie = movie;
        if (moviesProvider.moviesModel != null) {
          updatedMovie = moviesProvider.moviesModel!.data.firstWhere(
            (m) => m["id"] == movie["id"],
            orElse: () => movie,
          );
        }

        final name = updatedMovie["name"];
        final poster = updatedMovie["poster"];
        final showDate = updatedMovie["showDate"];
        final showTime = updatedMovie["showTime"];
        final List seats = updatedMovie["seats"];

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
            title: Text(name),
            centerTitle: true,
          ),
          body: Column(
            children: [
              CustomListTile(
                name: name,
                poster: poster,
                showDate: showDate,
                showTime: showTime,
              ),
              const SizedBox(height: 12),
              const Text(
                "Select Your Seat",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: seats.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemBuilder: (context, index) {
                    final seat = seats[index];
                    bool isBooked = seat["status"] == "Booked";

                    return CustomCard(
                      seat: seat,
                      onTap: () async {
                        if (isBooked) {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpdateCancelPage(seat: seat),
                            ),
                          );
                        } else {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  BookSeatPage(seat: seat, movie: updatedMovie),
                            ),
                          );
                        }

                        if (context.mounted) {
                          Provider.of<MoviesProvider>(
                            context,
                            listen: false,
                          ).getMoviesRequestData();
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
