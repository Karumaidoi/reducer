import 'dart:convert';

import 'package:reducer/model/userModel.dart';
import 'package:http/http.dart' as http;
import 'package:reducer/model/userModelg.dart';

class Network {
  static Future<List<UsersModel>> getUsers() async {
    try {
      // Perfrom actual API call
      var res = await http.get(
        Uri.parse(
            'https://us-central1-ti-reactjs-test.cloudfunctions.net/app/api/users'),
        headers: <String, String>{},
      );

      // Decode data
      List jsonResponse = jsonDecode(res.body);

      // Return the data
      return jsonResponse.map((data) => UsersModel.fromJson(data)).toList();
    } catch (err) {
      // Catch errors
      throw Exception(err);
    }
  }

  static Future<UserModel> getUser(String id) async {
    try {
      // Make an API Call
      var res = await http.get(
        Uri.parse(
            'https://us-central1-ti-reactjs-test.cloudfunctions.net/app/api/user/${id}'),
        headers: <String, String>{},
      );

      // Return Decoded data
      return UserModel.fromJson(jsonDecode(res.body));
    } catch (err) {
      // Catch errors
      throw Exception(err);
    }
  }

  static Future<UserModel> patchUser(String id, String name, String email,
      String occupation, String bio) async {
    try {
      // Perform actual API call
      var res = await http.patch(
        Uri.parse(
            'https://us-central1-ti-reactjs-test.cloudfunctions.net/app/api/user/${id}'),
        headers: <String, String>{},
        body: <String, dynamic>{
          "name": name,
          "email": email,
          "occupation": occupation,
          "bio": bio
        },
      );

      // return the new updated user
      return UserModel.fromJson(jsonDecode(res.body));
    } catch (err) {
      // Catch errors
      throw Exception(err);
    }
  }
}
