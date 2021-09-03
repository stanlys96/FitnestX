part of 'models.dart';

class Data {
  Data({this.firstName, this.lastName, this.email, this.password});

  String? firstName;
  String? lastName;
  String? email;
  String? password;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        password: json["password"],
      );
}
