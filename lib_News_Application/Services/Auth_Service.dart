import 'package:dio/dio.dart';
import 'package:flutter_news_application/Models/Auth_Model.dart';

class AuthService {
  static Dio dio = Dio();

  static Register({
    required String Name,
    required String Email,
    required String Phone,
    required String Password,
  }) async {
    try {
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Register/AddUser",
        data: {
          "Name": Name,
          "Email": Email,
          "Phone": Phone,
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
