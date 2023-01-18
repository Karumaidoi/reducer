// A class responsible for formatting our User Object
class UserModel {
  // Initializing our Required fields
  late String name;
  late String email;
  late String occupation;
  late String bio;

  // Making our Class constructor
  UserModel(
      {required this.name,
      required this.email,
      required this.occupation,
      required this.bio});

  // Factorizing our properties with data from our Object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json['email'],
        name: json['name'],
        occupation: json["occupation"],
        bio: json["bio"]);
  }
}
