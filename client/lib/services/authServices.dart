part of 'services.dart';

class AuthServices {
  final baseUrl = 'https://fitnestx-app.herokuapp.com/users';
  String? message;

  Future register(
      String firstName, String lastName, String email, String password) async {
    String url = baseUrl + '/register';
    Map<String, String> headers = {"Content-type": "application/json"};
    var body = jsonEncode({
      "first_name": "$firstName",
      "last_name": "$lastName",
      "email": "$email",
      "password": "$password"
    });
    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    return response;
  }

  Future completeProfile(String gender, String dateOfBirth, double weight,
      double height, String email) async {
    String url = baseUrl + '/completeProfile/$email';
    Map<String, String> headers = {"Content-type": "application/json"};
    var body = jsonEncode({
      "gender": "$gender",
      "date_of_birth": "$dateOfBirth",
      "weight": "$weight",
      "height": "$height"
    });
    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);
    return response;
  }

  Future addGoals(String email, String goals) async {
    String url = baseUrl + '/addGoals/$email';
    Map<String, String> headers = {"Content-type": "application/json"};
    var body = jsonEncode({
      "goals": "$goals",
    });
    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);
    return response;
  }
}
