part of 'models.dart';

class LoginData {
  LoginData(
      {this.email, this.firstName, this.lastName, this.token, this.message});

  String? email;
  String? firstName;
  String? lastName;
  String? token;
  String? message;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        token: json["token"],
        message: json["message"],
      );
}
