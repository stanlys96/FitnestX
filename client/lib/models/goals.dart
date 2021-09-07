part of 'models.dart';

class GoalsData {
  GoalsData({this.goals});

  String? goals;

  factory GoalsData.fromJson(Map<String, dynamic> json) => GoalsData(
        goals: json["goals"],
      );
}
