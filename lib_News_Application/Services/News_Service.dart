import 'package:dio/dio.dart';
import 'package:flutter_news_application/Models/News_Model.dart';

class NewsService {
  static Dio dio = Dio();

  static getNewsRequest() async {
    try {
      Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=866f2bfbe79749208ba10d5fc8ece94a",
      );

      if (response.statusCode == 200) {
        return NewsModel.fromJSON(response.data);
      } else {
        throw Exception(
          "Failed to load news (Status code: ${response.statusCode})",
        );
      }
    } on DioException catch (e) {
      throw new Exception("Fetching Error ($e)");
    } catch (other_error) {
      throw Exception(other_error);
    }
  }

  static searchNewsRequest(String query) async {
    try {
      Response response = await dio.get(
        "https://newsapi.org/v2/everything?q=$query&from=2026-10-18&sortBy=publishedAt&apiKey=866f2bfbe79749208ba10d5fc8ece94a",
      );

      if (response.statusCode == 200) {
        return NewsModel.fromJSON(response.data);
      } else {
        throw Exception("Failed to search news");
      }
    } on DioException catch (e) {
      throw Exception("Fetching Error ($e)");
    } catch (other_error) {
      throw Exception(other_error);
    }
  }
}
