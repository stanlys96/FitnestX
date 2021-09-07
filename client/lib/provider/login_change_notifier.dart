part of 'providers.dart';

class LoginChangeNotifier extends ChangeNotifier {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();

  final authServices = AuthServices();

  get scaffoldKey => _scaffoldKey;
  get formKey => _formKey;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  void handleLogin(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      http.Response jsonResponse = await authServices.login(
        _emailController.text,
        _passwordController.text,
      );
      LoginData result = new LoginData.fromJson(jsonDecode(jsonResponse.body));
      if (result.message == "Success") {
        final snackBar = SnackBar(content: Text("Successfully logged in!"));
        prefs.setString("emailLoggedIn", result.email!);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WelcomePage()),
        );
      } else {
        final snackBar = SnackBar(content: Text(result.message!));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      print(e);
    }
  }
}
