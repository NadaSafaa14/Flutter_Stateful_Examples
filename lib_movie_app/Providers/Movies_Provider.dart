import 'package:flutter/material.dart';
import 'package:flutter_movie_application/Models/Movies_Model.dart';
import 'package:flutter_movie_application/Services/Movies_Service.dart';

class MoviesProvider extends ChangeNotifier {
  MoviesModel? moviesModel;

  Future<void> getMoviesRequestData() async {
    moviesModel = await MoviesService.getMovies();
    notifyListeners();
  }

  Future<void> addBookingRequest({
    required int seatId,
    required int movieId,
    required String CustomerName,
  }) async {
    await MoviesService.AddBooking(seatId: seatId, CustomerName: CustomerName , movieId: movieId);
    moviesModel = await MoviesService.getMovies();
    notifyListeners();
  }

  Future<void> updateBookingRequest({
    required int id,
    required String CustomerName,
  }) async {
    await MoviesService.UpdateBooking(id: id, CustomerName: CustomerName);
    moviesModel = await MoviesService.getMovies();
    notifyListeners();
  }

  Future<void> deleteBookingRequest({required int id}) async {
    await MoviesService.DeleteBooking(id: id);
    moviesModel = await MoviesService.getMovies();
    notifyListeners();
  }
}
