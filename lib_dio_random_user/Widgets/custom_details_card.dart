import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomDetailsCard extends StatelessWidget {
  String name;
  String email;
  String photoURL;
  String Address;

  CustomDetailsCard({
    super.key,
    required this.name,
    required this.email,
    required this.photoURL,
    required this.Address,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 400,
        child: Card(
          elevation: 4,
          color: Colors.deepPurple[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(photoURL),
                maxRadius: 75,
              ),
              SizedBox(height: 20),
              Text(name, style: TextStyle(fontSize: 30)),
              ListTile(
                title: Text("Email"),
                subtitle: Text(email),
                leading: Icon(Icons.email, color: Colors.deepPurple),
              ),
              Container(height: 1.5, width: 330, color: Colors.deepPurple),
              ListTile(
                title: Text("Address"),
                subtitle: Text(Address),
                leading: Icon(Icons.location_pin, color: Colors.deepPurple),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
