import 'package:flutter/material.dart';
import 'package:flutter_movie_application/Providers/Movies_Provider.dart';
import 'package:flutter_movie_application/Views/Movie_Details.dart';
import 'package:flutter_movie_application/Widgets/Custom_List_Tile.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        title: Text("Movies"),
        centerTitle: true,
      ),

      body: Consumer<MoviesProvider>(
        builder: (context, value, child) {
          if (value.moviesModel == null) {
            value.getMoviesRequestData();
            return Center(
              child: CircularProgressIndicator(color: Colors.deepOrange),
            );
          }
          return ListView.builder(
            itemCount: value.moviesModel!.data.length,
            itemBuilder: (context, index) {
              final movie = value.moviesModel!.data[index];

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetails(movie: movie),
                    ),
                  );
                },
                child: CustomListTile(
                  name: movie["name"],
                  poster: movie["poster"],
                  showDate: movie["showDate"],
                  showTime: movie["showTime"],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
