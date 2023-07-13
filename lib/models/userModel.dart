import 'dart:convert';

class User {
  String firstName;
  String lastName;
  String email;
  String password;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
      };
}
