class NewsModel {
  
  List<dynamic> articles;

  NewsModel({required this.articles});

  factory NewsModel.fromJSON(Map<String,dynamic> json)
  {
    return NewsModel(articles: json["articles"]);
  }

}