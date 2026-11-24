import 'package:dio/dio.dart';
import 'package:flutter_quiz_2_wheather_app/Models/AuthModel.dart';

class AuthService {
  static Dio dio = Dio();

  static Register({
    required String Name,
    required String Email,
    required String Password,
    required String Phone,
  }) async {
    try {
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Register/AddUser",
        data: {
          "Name": Name,
          "Email": Email,
          "Password": Password,
          "phone" : Phone
        },
      );
      return AuthModel.fromJSON(response.data);
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  static LogIn({
    required String Email,
    required String Password,
  }) async {
    try {
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Login/CheckUser",
        data: {
          "Email": Email,
          "Password": Password,
        },
      );
      return AuthModel.fromJSON(response.data);
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}
