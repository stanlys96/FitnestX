part of 'providers.dart';

class RegisterChangeNotifier with ChangeNotifier {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _firstNameController = new TextEditingController();
  final _lastNameController = new TextEditingController();
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();
  String dateOfBirth = '';
  final _weightController = new TextEditingController();
  final _heightController = new TextEditingController();

  List<String> listGender = ["Male", "Female"];

  final authServices = AuthServices();

  String _selectedGender = "Male";

  get scaffoldKey => _scaffoldKey;
  get formKey => _formKey;
  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  String get selectedGender => _selectedGender;
  TextEditingController get weightController => _weightController;
  TextEditingController get heightController => _heightController;

  void setSelectedGender(String value) {
    _selectedGender = value;
    notifyListeners();
  }

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

  void completeProfile(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var email = prefs.getString("email");
      http.Response jsonResponse = await authServices.completeProfile(
        _selectedGender,
        dateOfBirth,
        double.parse(_weightController.text),
        double.parse(_heightController.text),
        email!,
      );
      CompleteProfileData result =
          new CompleteProfileData.fromJson(jsonDecode(jsonResponse.body));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GoalsPage()),
      );
    } catch (e) {
      print(e);
    }
  }

  void handleCompleteProfile(BuildContext context) async {}
}
