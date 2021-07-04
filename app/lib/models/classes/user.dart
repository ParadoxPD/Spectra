class User {
  String email;
  String name;
  String state;
  String district;
  String type;
  String password;
  String apiKey;
  String id;

  User(this.email, this.name, this.state, this.district, this.type,
      this.password, this.apiKey, this.id);

  User.fromJson(Map<String, dynamic> parsedJson)
      : name = parsedJson['fullname'],
        state = parsedJson['state'],
        district = parsedJson['district'],
        email = parsedJson['email'],
        apiKey = parsedJson['token'],
        id = parsedJson['id'],
        type = parsedJson['type'];
}
