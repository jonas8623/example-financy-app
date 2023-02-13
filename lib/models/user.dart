class UserModel {

  final String? id;
  final String? name;
  final String? email;
  final String? password;

  UserModel({this.id, this.name, this.email, this.password});

  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, email: $email, password: $password}';
  }
}