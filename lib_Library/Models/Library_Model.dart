class LibraryModel {

  List<dynamic> books ;

  LibraryModel({required this.books});

  factory LibraryModel.FromJSON({required List<dynamic> result})
  {
    return LibraryModel(books: result);
  }
}