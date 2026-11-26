import 'package:flutter/material.dart';
import 'package:flutter_library_application/Models/Library_Model.dart';
import 'package:flutter_library_application/Services/Library_Service.dart';

class LibraryProvider extends ChangeNotifier
{
  LibraryModel? libraryModel;
  LibraryModel? searchModel;

    Future<void> getBooksRequestData() async
    {
    libraryModel = await LibraryService.getBooks();
    notifyListeners();
  }

  Future<void> searchBooksRequestData({required String query}) async
  {
    searchModel = await LibraryService.searchBooksRequest(query);
    notifyListeners();
  }
}