import 'package:flutter/material.dart';
import 'package:flutter_news_application/Models/News_Model.dart';
import 'package:flutter_news_application/Services/News_Service.dart';

class NewsProvider extends ChangeNotifier
{
  NewsModel? newsModel ;

  getNewsRequestData() async
  {
    newsModel = await NewsService.getNewsRequest();
    notifyListeners(); 
  }
  searchNewsRequestData(String query) async {
    if (query.isEmpty) return;

    newsModel = null;
    notifyListeners();

    try {
      newsModel = await NewsService.searchNewsRequest(query);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }
}