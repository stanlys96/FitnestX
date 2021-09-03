part of 'providers.dart';

class RegisterChangeNotifier with ChangeNotifier {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _firstNameController = new TextEditingController();
  final _lastNameController = new TextEditingController();
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();

  final authServices = AuthServices();

  get scaffoldKey => _scaffoldKey;
  get formKey => _formKey;
  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  void handleRegister(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      http.Response jsonResponse = await authServices.register(
        _firstNameController.text,
        _lastNameController.text,
        _emailController.text,
        _passwordController.text,
      );
      Data result = new Data.fromJson(jsonDecode(jsonResponse.body));
      prefs.setString("email", result.email!);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CompleteProfile()),
      );
    } catch (e) {
      print(e);
    }
  }

  void handleCompleteProfile(BuildContext context) async {}
}
