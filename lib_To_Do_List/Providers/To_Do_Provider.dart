import 'package:flutter/material.dart';
import 'package:flutter_to_do_list_application/Models/To_Do_Model.dart';
import 'package:flutter_to_do_list_application/Services/To_Do_Service.dart';

class ToDoProvider extends ChangeNotifier {
  ToDoModel? toDoModel;

  Future<void> getToDosRequestData() async {
    toDoModel = await ToDoService.getToDos();
    notifyListeners();
  }

  Future<void> addToDoRequest({required String title}) async {
    await ToDoService.AddToDo(title: title);
    toDoModel = await ToDoService.getToDos(); 
    notifyListeners();
  }

  Future<void> updateToDoRequest({required int id, required String title}) async {
    await ToDoService.UpdateToDo(id: id, title: title);
    toDoModel = await ToDoService.getToDos(); // Refresh list after update
    notifyListeners();
  }

  Future<void> deleteToDoRequest({required int id}) async {
    await ToDoService.DeleteToDo(id: id);
    toDoModel = await ToDoService.getToDos(); // Refresh list after delete
    notifyListeners();
  }
}