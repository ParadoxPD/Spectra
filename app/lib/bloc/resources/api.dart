import 'dart:async';
// import 'dart:io';
// import 'package:http/http.dart' as http;
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../../models/classes/user.dart';

class Api {
  Client client = Client();
  // final _apiKey = 'your_api_key';

  Future<User> registerUser(String username, String firstname, String lastname,
      String password, String email) async {
    print("entered");
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var body = json.encode({
      "email": email,
      "username": username,
      "password": password,
      "firstname": firstname,
      "lastname": lastname
    });

    final response = await client.post("http://127.0.0.1:5000/api/register",
        headers: headers, body: body);
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body)['data'];
      User user = User.fromJson(responseJson);
      return user;
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future signinUser(String username, String password) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var body = json.encode({
      "username": username,
      "password": password,
    });

    final response = await client.post("http://127.0.0.1:5000/api/signin",
        headers: headers, body: body);
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body)['data'];
      // User user = User.fromJson(responseJson);
      // print(user.apiKey);
      // return user;
    } else {
      throw Exception('Failed to load post');
    }

    // print(responseJson);
    // return response;
  }
}
