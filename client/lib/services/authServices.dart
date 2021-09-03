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
}
