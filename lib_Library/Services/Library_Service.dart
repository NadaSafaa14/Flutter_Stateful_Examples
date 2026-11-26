import 'package:dio/dio.dart';
import 'package:flutter_library_application/Models/Library_Model.dart';

class LibraryService 
{
  static Dio dio = Dio();

  static getBooks() async {
    try {
      Response response = await dio.get(
        "https://librarysystemflutterteam.runasp.net/api/Book/GetBooks",
      );

      return LibraryModel.FromJSON(result: response.data);
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  
  static searchBooksRequest(String query) async {
    try {
      Response response = await dio.get(
        "https://librarysystemflutterteam.runasp.net/api/Book/GetBookByName?Bookname=$query",
      );

      if (response.statusCode == 200) {
        return LibraryModel.FromJSON(result: response.data);
      } else {
        throw Exception("Failed to search Books");
      }
    } on DioException catch (e) {
      throw Exception("Fetching Error ($e)");
    } catch (other_error) {
      throw Exception(other_error);
    }
  }

}