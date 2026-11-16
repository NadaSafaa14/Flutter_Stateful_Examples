import 'package:dio/dio.dart';
import 'package:flutter_application_dio_random_user/Models/random_user_model.dart';

class RandomUserService {
  static Dio dio = Dio();

  static getRandomUsers() async {
    try {
      Response response = await dio.get(
        "https://randomuser.me/api/?results=10",
      );

      if (response.statusCode == 200) {
        return RandomUserModel.fromJSON(response.data);
      } else {
        throw Exception(
          "Failed to load random users (Status code: ${response.statusCode})",
        );
      }
    } on DioException catch (e) {
      throw new Exception("Fetching Error ($e)");
    } catch (other_error) {
      throw Exception(other_error);
    }
  }
}
