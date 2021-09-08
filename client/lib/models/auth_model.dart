part of 'models.dart';

class Data {
  Data(
      {this.firstName, this.lastName, this.email, this.password, this.message});

  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        password: json["password"],
        message: json["message"],
      );
}
