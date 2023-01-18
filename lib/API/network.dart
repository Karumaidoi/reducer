import 'dart:convert';

import 'package:reducer/model/userModel.dart';
import 'package:http/http.dart' as http;

class Network {
  static Future<List<UserModel>> getUsers() async {
    try {
      var res = await http.get(
        Uri.parse(
            'https://us-central1-ti-reactjs-test.cloudfunctions.net/app/api/users'),
        headers: <String, String>{},
      );

      print(res.body);
      List jsonResponse = jsonDecode(res.body);

      return jsonResponse.map((data) => UserModel.fromJson(data)).toList();
    } catch (err) {
      throw Exception(err);
    }
  }
}
