import 'package:flutter/material.dart';
import 'package:flutter_news_application/Providers/News_Provider.dart';
import 'package:flutter_news_application/Views/News_Details_Screen.dart';
import 'package:flutter_news_application/Views/Search_Screen.dart';
import 'package:flutter_news_application/Widgets/CustomNewsCard.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Headlines"),
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: Consumer<NewsProvider>(
        builder: (context, value, child) {
          if (value.newsModel == null) {
            value.getNewsRequestData();
            return const Center(
              child: CircularProgressIndicator(color: Colors.purple),
            );
          }
          return ListView.builder(
            itemCount: value.newsModel!.articles.length,
            itemBuilder: (context, index) {
              final news = value.newsModel!.articles[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetailsScreen(news: news),
                    ),
                  );
                },
                child: CustomNewsCard(
                  title: news["title"],
                  description: news["description"],
                  photoURL: news["urlToImage"],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
