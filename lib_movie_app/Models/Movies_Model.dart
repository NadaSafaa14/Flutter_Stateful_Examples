class MoviesModel {
  bool status;
  String message;
  dynamic data;

  MoviesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory MoviesModel.FromJSON(Map<String, dynamic> json) {
    return MoviesModel(
      status: json["status"] ?? false,
      message: json["message"] ?? "",
      data: json["data"] ?? [],
    );
  }
}
