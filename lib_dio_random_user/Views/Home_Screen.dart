import 'package:flutter/material.dart';
import 'package:flutter_application_dio_random_user/Models/random_user_model.dart';
import 'package:flutter_application_dio_random_user/Providers/random_user_provider.dart';
import 'package:flutter_application_dio_random_user/Views/User_Details_Screen.dart';
import 'package:flutter_application_dio_random_user/Widgets/custom_list_tile.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Consumer<RandomUserProvider>(
        builder: (context, provider, child) {
          return FloatingActionButton(
            onPressed: () {
              provider.getRandomUserData();
            },
            child: const Icon(Icons.replay_outlined, color: Colors.deepPurple),
          );
        },
      ),
      appBar: AppBar(
        title: const Text("Random Users"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Consumer<RandomUserProvider>(
        builder: (context, value, child) {
          if (value.randomUserModel == null) {
            value.getRandomUserData();
            return const Center(
              child: CircularProgressIndicator(color: Colors.deepPurple),
            );
          }
          return ListView.builder(
            itemCount: value.randomUserModel!.results.length,
            itemBuilder: (context, index) {
              final user = value.randomUserModel!.results[index];

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserDetailsScreen(user: user),
                    ),
                  );
                },
                child: CustomListTile(
                  title:
                      "${user["name"]["title"]} ${user["name"]["first"]} ${user["name"]["last"]}",
                  subtitle: user["email"],
                  photoURL: user["picture"]["thumbnail"],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
