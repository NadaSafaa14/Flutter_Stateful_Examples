import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_dio_random_user/Widgets/custom_details_card.dart';

class UserDetailsScreen extends StatelessWidget {
  dynamic user;
  UserDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    String fullName =
        "${user["name"]["title"]} ${user["name"]["first"]} ${user["name"]["last"]}";

    String email = user["email"];

    String photoURL = user["picture"]["large"];
    
    String address =
        "${user["location"]["city"]}, ${user["location"]["country"]}";

    return Scaffold(
      appBar: AppBar(
        title: Text("User Details"),
        // title: Text(fullName),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: CustomDetailsCard(
          name: fullName,
          email: email,
          Address: address,
          photoURL: photoURL,
        ),
      ),
    );
  }
}
