part of 'models.dart';

class CompleteProfileData {
  CompleteProfileData(
      {this.gender, this.date_of_birth, this.weight, this.height});

  String? gender;
  String? date_of_birth;
  String? weight;
  String? height;

  factory CompleteProfileData.fromJson(Map<String, dynamic> json) =>
      CompleteProfileData(
        gender: json["gender"],
        date_of_birth: json["date_of_birth"],
        weight: json["weight"],
        height: json["height"],
      );
}
