import 'dart:convert';

import 'package:reducer/model/userModel.dart';
import 'package:http/http.dart' as http;
import 'package:reducer/model/userModelg.dart';

class Network {
  static Future<List<UsersModel>> getUsers() async {
    try {
      var res = await http.get(
        Uri.parse(
            'https://us-central1-ti-reactjs-test.cloudfunctions.net/app/api/users'),
        headers: <String, String>{},
      );

      print(res.body);
      List jsonResponse = jsonDecode(res.body);

      return jsonResponse.map((data) => UsersModel.fromJson(data)).toList();
    } catch (err) {
      throw Exception(err);
    }
  }

  static Future<UserModel> getUser(String id) async {
    try {
      var res = await http.get(
        Uri.parse(
            'https://us-central1-ti-reactjs-test.cloudfunctions.net/app/api/user/${id}'),
        headers: <String, String>{},
      );

      print(res.body);

      return UserModel.fromJson(jsonDecode(res.body));
    } catch (err) {
      throw Exception(err);
    }
  }
}
