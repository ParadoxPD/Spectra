import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../../models/classes/user.dart';

class Api {
  Client client = Client();
  // final _apiKey = 'your_api_key';

  Future<User> registerUser(String email, String name, String state,
      String district, String type, String password) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var body = json.encode({
      "email": email,
      "fullname": name,
      "state": state,
      "district": district,
      "type": type,
      "password1": password,
      "password2": password
    });

    final response = await client.post(
        "http://localhost:5001/v1/users/register",
        headers: headers,
        body: body);
    // print(response.body);
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      // print(responseJson);
      User user = User.fromJson(responseJson);
      return user;
    } else {
      print('Failed to load post');
    }
  }

  Future<User> signinUser(String email, String password) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var body = json.encode({
      "email": email,
      "password": password,
    });

    final response = await client.post("http://localhost:5001/v1/users/login",
        headers: headers, body: body);
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      User user = User.fromJson(responseJson);
      return user;
    } else {
      throw Exception('Failed to load post');
    }

    // print(responseJson);
    // return response;
  }
}
