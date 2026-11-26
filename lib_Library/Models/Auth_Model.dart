class AuthModel {
  bool status;
  String message;

  AuthModel({required this.status, required this.message});

  factory AuthModel.fromJSON(Map<String, dynamic> json) {
    return AuthModel(status: json["status"], message: json["message"]);
  }
}
