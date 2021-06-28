import 'dart:async';
import 'api.dart';
import '../../models/classes/user.dart';

class Repository {
  final api = Api();

  Future<User> registerUser(String email, String name, String state,
      String district, String type, String password) async {
    Future<User> data =
        api.registerUser(email, name, state, district, type, password);
    return data;
  }

  Future<User> signinUser(String email, String password) async {
    Future<User> data = api.signinUser(email, password);
    return data;
  }
}
