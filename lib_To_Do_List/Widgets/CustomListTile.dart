import 'package:flutter/material.dart';

class Customlisttile extends StatelessWidget {
  String title;
  void Function()? onEdit;
  void Function()? onDelete;

  Customlisttile({super.key, required this.title, this.onEdit, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        title: Text(title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: onEdit,
              icon: const Icon(Icons.edit, color: Colors.blueAccent),
            ),
            const SizedBox(width: 2),
            IconButton(
              onPressed: onDelete,
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
