import 'package:flutter/material.dart';
import 'package:flutter_news_application/Providers/News_Provider.dart';
import 'package:flutter_news_application/Views/News_Details_Screen.dart';
import 'package:flutter_news_application/Widgets/CustomNewsCard.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search News"),
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search for news (e.g. Tesla)...",
                prefixIcon: const Icon(Icons.search, color: Colors.purple),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onSubmitted: (query) {
                Provider.of<NewsProvider>(
                  context,
                  listen: false,
                ).searchNewsRequestData(query);
              },
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: Consumer<NewsProvider>(
              builder: (context, value, child) {
                if (value.newsModel == null) {
                  return const Center(
                    child: Text(
                      "Type a keyword and press enter to search",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
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
          ),
        ],
      ),
    );
  }
}
