class UserModel {
  late String name;
  late String email;
  late String occupation;
  late String bio;

  UserModel(
      {required this.name,
      required this.email,
      required this.occupation,
      required this.bio});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json['email'],
        name: json['name'],
        occupation: json["occupation"],
        bio: json["bio"]);
  }
}
