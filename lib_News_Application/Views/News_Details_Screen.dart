import 'package:flutter/material.dart';
import 'package:flutter_news_application/Widgets/Custom_News_Details_Card.dart';

class NewsDetailsScreen extends StatelessWidget {
  dynamic news;
  NewsDetailsScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    String title = news["title"];
    String description = news["description"];
    String photoURL = news["urlToImage"];
    String content = news["content"];
    String publishedAt = news["publishedAt"];
    String author = news["author"]??"fady";

    return Scaffold(
      appBar: AppBar(
        title: Text("News Details"),
        centerTitle: true,
        actions: [Icon(Icons.share), SizedBox(width: 10)],
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: CustomNewsDetailsCard(
        title: title,
        author: author,
        content: content,
        description: description,
        photoURL: photoURL,
        publishedAt: publishedAt,
      ),
    );
  }
}
