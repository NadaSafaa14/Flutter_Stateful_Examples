class Weathermodel {
  List<dynamic> country;

  Weathermodel({required this.country});

  factory Weathermodel.fromJSON(Map<String, dynamic> json) {
    return Weathermodel(country: json["country"]);
  }
}
