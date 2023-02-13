import 'dart:convert';

class UserModel {

  String? id;
  String? name;
  String? email;
  String? password;

  UserModel({this.id, this.name, this.email, this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    email = json['email'] ?? "";
    password = json['password'] ?? "";
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic> {
      'id': id,
      'name': name,
      'email': email,
      'password': password
    };
  }

  String toJson() {
    return json.encode(toMap());
  }

  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, email: $email, password: $password}';
  }
}