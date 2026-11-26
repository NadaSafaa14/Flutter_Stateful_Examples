import 'package:flutter/material.dart';
import 'package:flutter_library_application/Providers/Library_Provider.dart';
import 'package:flutter_library_application/Views/Details_Screen.dart';
import 'package:flutter_library_application/Views/Search_Screen.dart';
import 'package:flutter_library_application/Widgets/Custom_List_Tile.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff123B63),
        foregroundColor: Colors.white,
        title: Text("Books"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchScreen()),
            );
          },
          icon: Icon(Icons.search_rounded),
        ),
      ),

      body: Consumer<LibraryProvider>(
        builder: (context, value, child) {
          if (value.libraryModel == null) {
            value.getBooksRequestData();
            return Center(
              child: CircularProgressIndicator(color: Color(0xff123B63)),
            );
          }
          return ListView.builder(
            itemCount: value.libraryModel!.books.length,
            itemBuilder: (context, index) {
              final book = value.libraryModel!.books[index];

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
                  title: book["title"],
                  imageUrl: book["imageUrl"],
                  rate: book["rate"],
                  price: book["price"],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
