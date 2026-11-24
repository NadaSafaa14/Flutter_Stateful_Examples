import 'package:flutter/material.dart';
import 'package:flutter_to_do_list_application/Providers/To_Do_Provider.dart';
import 'package:flutter_to_do_list_application/Widgets/CustomBottomSheet.dart';
import 'package:flutter_to_do_list_application/Widgets/CustomListTile.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.teal,
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Consumer<ToDoProvider>(
            builder: (context, provider, child) {
              if (provider.toDoModel == null) {
                provider.getToDosRequestData();
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              }

              final todos = provider.toDoModel!.todoList;

              return Column(
                children: [
                  const SizedBox(height: 30),
                  Row(
                    children: const [
                      Icon(
                        Icons.checklist_rtl_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                      Text(
                        " ToDayDo",
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "${todos.length} Tasks",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: ListView.builder(
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          final todo = todos[index];
                          return Customlisttile(
                            title: todo["title"] ?? "",
                            onEdit: () {
                              final TextEditingController editController =
                                  TextEditingController(
                                    text: todo["title"] ?? "",
                                  );

                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => Custombottomsheet(
                                  controller: editController,
                                  titleText: "Edit Task",
                                  onSubmit: () {
                                    if (editController.text.trim().isNotEmpty) {
                                      Provider.of<ToDoProvider>(
                                        context,
                                        listen: false,
                                      ).updateToDoRequest(
                                        id: todo["id"],
                                        title: editController.text.trim(),
                                      );
                                      Navigator.pop(context);
                                    }
                                  },
                                ),
                              );
                            },
                            onDelete: () {
                              Provider.of<ToDoProvider>(
                                context,
                                listen: false,
                              ).deleteToDoRequest(id: todo["id"]);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        onPressed: () {
          final TextEditingController addController = TextEditingController();

          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => Custombottomsheet(
              controller: addController,
              titleText: "Add New Task",
              onSubmit: () {
                if (addController.text.trim().isNotEmpty) {
                  Provider.of<ToDoProvider>(
                    context,
                    listen: false,
                  ).addToDoRequest(title: addController.text);

                  Navigator.pop(context);
                }
              },
            ),
          );
        },
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
