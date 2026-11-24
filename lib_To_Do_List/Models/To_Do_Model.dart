class ToDoModel {
  bool status;
  String message;
  List<dynamic> todoList; 

  ToDoModel({required this.status, required this.message, required this.todoList});

  factory ToDoModel.FromJSON(Map<String, dynamic> json) {
    return ToDoModel(
      status: json["status"] ?? false,
      message: json["message"] ?? "",
      todoList: json["todoList"] ?? [],
    );
  }
}