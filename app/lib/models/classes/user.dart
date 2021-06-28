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
      : name = parsedJson['name'],
        state = parsedJson['state'],
        district = parsedJson['district'],
        email = parsedJson['email'],
        password = parsedJson['password'],
        apiKey = parsedJson['api_key'],
        id = parsedJson['id'],
        type = parsedJson['type'];
}
