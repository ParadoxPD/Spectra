import 'dart:async';
import 'api.dart';
import '../../models/classes/user.dart';

class Repository {
  final api = Api();

  Future<User> registerUser(String username, String firstname, String lastname,
      String password, String email) async {
    Future<User> data =
        api.registerUser(username, firstname, lastname, password, email);
    return data;
  }

  Future<User> signinUser(String username, String password) async {
    Future<User> data = api.signinUser(username, password);
    return data;
  }
}
