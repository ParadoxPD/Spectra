class User {
  String username;
  String lastname;
  String firstname;
  String email;
  String password;
  String apiKey;
  String id;

  User(this.username, this.lastname, this.firstname, this.email, this.password,
      this.apiKey, this.id);

  User.fromJson(Map<String, dynamic> parsedJson)
      : username = parsedJson['username'],
        lastname = parsedJson['lastname'],
        firstname = parsedJson['firstname'],
        email = parsedJson['email'],
        password = parsedJson['password'],
        apiKey = parsedJson['api_key'],
        id = parsedJson['id'];
}
