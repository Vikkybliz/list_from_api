import 'dart:convert';

import 'package:http/http.dart' as http;

class Users {
  String name;
  String username;
  String email;
  Users({
    required this.name,
    required this.username,
    required this.email,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        name: json["name"],
        username: json["username"],
        email: json["email"],
      );
}

Future<Users> getUsers() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/users'),
  );
  if (response.statusCode == 200) {
    return Users.fromJson(json.decode(response.body)[0]);
  } else {
    throw Exception('Failed to load post');
  }
}

