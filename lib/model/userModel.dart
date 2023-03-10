// A class responsible for formatting our User Object
class UsersModel {
  // Initializing our Required fields
  late String name;
  late String email;
  late String occupation;
  late String bio;
  late String id;

  // Making our Class constructor
  UsersModel(
      {required this.name,
      required this.email,
      required this.occupation,
      required this.id,
      required this.bio});

  // Factorizing our properties with data from our Object
  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
        email: json['email'],
        name: json['name'],
        occupation: json["occupation"],
        id: json["id"],
        bio: json["bio"]);
  }
}
