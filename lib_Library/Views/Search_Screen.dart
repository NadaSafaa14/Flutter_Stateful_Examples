import 'package:flutter/material.dart';
import 'package:flutter_library_application/Providers/Library_Provider.dart';
import 'package:flutter_library_application/Views/Details_Screen.dart';
import 'package:flutter_library_application/Widgets/Custom_List_Tile.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Books"),
        backgroundColor: Color(0xff123B63),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                label: Text("Type a keyword ... "),
                prefixIcon: Icon(Icons.search_rounded),
                fillColor: Colors.blueGrey[100],
                filled: true,
              ),
              onSubmitted: (query) {
                Provider.of<LibraryProvider>(
                  context,
                  listen: false,
                ).searchBooksRequestData(query: query);
              },
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: Consumer<LibraryProvider>(
              builder: (context, value, child) {
                if (value.searchModel == null) {
                  return const Center(
                    child: Text(
                      "Type a keyword and press enter to search",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: value.searchModel!.books.length,
                  itemBuilder: (context, index) {
                    final book = value.searchModel!.books[index];

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(book: book),
                          ),
                        );
                      },
                      child: CustomListTile(
                        imageUrl: book["imageUrl"],
                        price: book["price"],
                        rate: book["rate"],
                        title: book["title"],
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
