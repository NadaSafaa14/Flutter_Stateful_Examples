import 'package:dio/dio.dart';
import 'package:flutter_to_do_list_application/Models/To_Do_Model.dart';

class ToDoService {
  static Dio dio = Dio();

  static getToDos() async {
    try {
      Response response = await dio.get(
        "https://mytodoapi.runasp.net/api/TodoItems/",
      );

      return ToDoModel.FromJSON(response.data);
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  static AddToDo({required String title}) async {
    try {
      Response response = await dio.post(
        "https://mytodoapi.runasp.net/api/TodoItems/",
        data: {"title": title},
      );

      return ToDoModel.FromJSON(response.data);
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  static UpdateToDo({required int id, required String title}) async {
    try {
      Response response = await dio.put(
        "https://mytodoapi.runasp.net/api/TodoItems/$id",
        data: {"title": title},
      );

      return ToDoModel.FromJSON(response.data);
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  static DeleteToDo({required int id}) async {
    try {
      Response response = await dio.delete(
        "https://mytodoapi.runasp.net/api/TodoItems/$id",
      );

      return ToDoModel.FromJSON(response.data);
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}
