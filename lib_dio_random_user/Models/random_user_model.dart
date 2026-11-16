class RandomUserModel {
  // String name ;
  // String email;
  // String picture;

  List<dynamic> results;

  RandomUserModel({required this.results});

  factory RandomUserModel.fromJSON(Map<String,dynamic> json)
  {
    return RandomUserModel(results: json["results"]);
  }

  // RandomUserModel({
  //   required this.name , required this.email , required this.picture
  // });

  // factory RandomUserModel.fromJSON(Map<String,dynamic> json)
  // {
  //   List<dynamic> results = json["results"];
  //   Map<String,dynamic> nameMap = results[];
  //   return RandomUserModel(name: results["name"], email: result["results"]["email"], picture: result["results"]["picture"]["thumbnail"]);
  // }
}