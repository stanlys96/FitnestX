part of 'models.dart';

class LoginData {
  LoginData({this.email, this.message});

  String? email;
  String? message;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        email: json["email"],
        message: json["message"],
      );
}
