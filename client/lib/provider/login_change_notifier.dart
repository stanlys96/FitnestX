part of 'providers.dart';

class LoginChangeNotifier extends ChangeNotifier {
  GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: "_loginPageScaffoldKey");
  GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: "_loginPageKey");
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();

  String emailError = "";
  String passwordError = "";

  final authServices = AuthServices();

  get scaffoldKey => _scaffoldKey;
  get formKey => _formKey;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  void handleLogin(BuildContext context) async {
    bool emailValidator = false;
    bool passwordValidator = false;
    bool canLogin = false;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (_emailController.text == "") {
        emailError = "Kolom Email harus diisi";
        emailValidator = false;
        notifyListeners();
      } else if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(_emailController.text)) {
        emailError = "Format email salah";
        emailValidator = false;
        notifyListeners();
      } else {
        emailError = "";
        emailValidator = true;
        notifyListeners();
      }

      if (_passwordController.text == "") {
        passwordError = "Kolom Password harus diisi";
        passwordValidator = false;
        notifyListeners();
      } else if (_passwordController.text.length < 6) {
        passwordError = "Password minimal 6 karakter";
        passwordValidator = false;
        notifyListeners();
      } else {
        passwordError = "";
        passwordValidator = true;
        notifyListeners();
      }

      if (emailValidator && passwordValidator) {
        canLogin = true;
      } else {
        canLogin = false;
      }

      if (canLogin) {
        http.Response jsonResponse = await authServices.login(
          _emailController.text,
          _passwordController.text,
        );
        LoginData result =
            new LoginData.fromJson(jsonDecode(jsonResponse.body));
        if (result.message == "Success") {
          final snackBar = SnackBar(content: Text("Successfully logged in!"));
          prefs.setString("emailLoggedIn", result.email!);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WelcomePage()),
          );
        } else {
          passwordError = result.message!;
          notifyListeners();
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
