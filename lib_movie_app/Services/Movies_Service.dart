import 'package:dio/dio.dart';
import 'package:flutter_movie_application/Models/Movies_Model.dart';

class MoviesService {
  static Dio dio = Dio();

  static getMovies() async {
    try {
      Response response = await dio.get(
        "https://apimovie.runasp.net/api/Movies",
      );

      return MoviesModel.FromJSON(response.data);
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  static AddBooking({required int seatId, required String CustomerName , required int movieId}) async {
    try {
      Response response = await dio.post(
        "https://apimovie.runasp.net/api/Bookings",
        data: {"seatId": seatId, "CustomerName": CustomerName , "movieId" : movieId},
      );

      return MoviesModel.FromJSON(response.data);
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  static UpdateBooking({required int id, required String CustomerName}) async {
    try {
      Response response = await dio.put(
        "https://apimovie.runasp.net/api/Bookings/$id",
        data: {"CustomerName": CustomerName},
      );

      return MoviesModel.FromJSON(response.data);
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  static DeleteBooking({required int id}) async {
    try {
      Response response = await dio.delete(
        "https://apimovie.runasp.net/api/Bookings/$id",
      );

      return MoviesModel.FromJSON(response.data);
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}
