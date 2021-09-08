part of 'providers.dart';

class RegisterChangeNotifier with ChangeNotifier {
  int _listTitleIndex = 0;

  GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: "_registerPageScaffoldKey");
  GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: '_registerPageKey');
  final _firstNameController = new TextEditingController();
  final _lastNameController = new TextEditingController();
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();
  String genderHint = "Choose Gender";
  String dateOfBirth = 'Select Date of Birth';
  final _weightController = new TextEditingController();
  final _heightController = new TextEditingController();

  String firstNameError = "";
  String lastNameError = "";
  String emailError = "";
  String passwordError = "";

  String genderError = "";
  String dateOfBirthError = "";
  String weightError = "";
  String heightError = "";

  CarouselController _buttonCarouselController = CarouselController();
  List<String> listImageUrl = [
    "assets/images/improve_shape.png",
    "assets/images/lean_and_tone.png",
    "assets/images/lose_fat.png"
  ];
  List<String> listDescription = [
    "I have a low amount of body fat and need/want to build more muscle",
    "I'm \"skinny fat\". Looks thin but have no shape. I want to learn adding muscle the right way",
    "I have over 20 lbs to lose. I want to drop all these fat and gain muscle mass",
  ];
  List<String> listTitles = [
    "Improve Shape",
    "Lean & Tone",
    "Lose Fat",
  ];

  List<String> listGender = ["Male", "Female"];
  final authServices = AuthServices();
  String _selectedGender = "Male";
  String _selectedTitle = "Improve Shape";

  get scaffoldKey => _scaffoldKey;
  get formKey => _formKey;
  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  String get selectedGender => _selectedGender;
  TextEditingController get weightController => _weightController;
  TextEditingController get heightController => _heightController;
  CarouselController get buttonCarouselController => _buttonCarouselController;
  String get selectedTitle => _selectedTitle;

  void setSelectedGender(String value) {
    _selectedGender = value;
    notifyListeners();
  }

  void handleRegister(BuildContext context) async {
    bool firstNameValidator = false;
    bool lastNameValidator = false;
    bool emailValidator = false;
    bool passwordValidator = false;
    bool canRegister = false;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (_firstNameController.text == "") {
        firstNameError = "Kolom First Name harus diisi";
        firstNameValidator = false;
        notifyListeners();
      } else {
        firstNameError = "";
        firstNameValidator = true;
        notifyListeners();
      }

      if (_lastNameController.text == "") {
        lastNameError = "Kolom Last Name harus diisi";
        lastNameValidator = false;
        notifyListeners();
      } else {
        lastNameError = "";
        lastNameValidator = true;
        notifyListeners();
      }

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

      if (firstNameValidator &&
          lastNameValidator &&
          emailValidator &&
          passwordValidator) {
        canRegister = true;
      } else {
        canRegister = false;
      }

      if (canRegister) {
        http.Response jsonResponse = await authServices.register(
          _firstNameController.text,
          _lastNameController.text,
          _emailController.text,
          _passwordController.text,
        );
        Data result = new Data.fromJson(jsonDecode(jsonResponse.body));
        if (result.message == "Success") {
          prefs.setString("email", result.email!);
          _emailController.text = "";
          _passwordController.text = "";
          _firstNameController.text = "";
          _lastNameController.text = "";
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => CompleteProfile()),
          );
        } else {
          emailError = result.message!;
          notifyListeners();
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void completeProfile(BuildContext context) async {
    bool genderValidator = false;
    bool dateOfBirthValidator = false;
    bool weightValidator = false;
    bool heightValidator = false;
    bool canContinue = false;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var email = prefs.getString("email");

      if (genderHint == "Choose Gender") {
        genderError = "Kolom gender harus diisi";
        genderValidator = false;
        notifyListeners();
      } else {
        genderError = "";
        genderValidator = true;
        notifyListeners();
      }

      if (dateOfBirth == "Select Date of Birth") {
        dateOfBirthError = "Kolom date of birth harus diisi";
        dateOfBirthValidator = false;
        notifyListeners();
      } else {
        dateOfBirthError = "";
        dateOfBirthValidator = true;
        notifyListeners();
      }

      if (weightController.text == "") {
        weightError = "Kolom weight harus diisi";
        weightValidator = false;
        notifyListeners();
      } else {
        weightError = "";
        weightValidator = true;
        notifyListeners();
      }

      if (heightController.text == "") {
        heightError = "Kolom height harus diisi";
        heightValidator = false;
        notifyListeners();
      } else {
        heightError = "";
        heightValidator = true;
        notifyListeners();
      }

      if (genderValidator &&
          dateOfBirthValidator &&
          weightValidator &&
          heightValidator) {
        canContinue = true;
      } else {
        canContinue = false;
      }

      if (canContinue) {
        http.Response jsonResponse = await authServices.completeProfile(
          _selectedGender,
          dateOfBirth,
          double.parse(_weightController.text),
          double.parse(_heightController.text),
          email!,
        );
        CompleteProfileData result =
            new CompleteProfileData.fromJson(jsonDecode(jsonResponse.body));
        _weightController.text = "";
        _heightController.text = "";
        dateOfBirth = "Select Date of Birth";
        genderHint = "Choose Gender";
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GoalsPage()),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  void changeSelectedTitle(String method) {
    if (method == "prev") {
      if (_listTitleIndex == 0) {
        _listTitleIndex = listTitles.length - 1;
      } else {
        _listTitleIndex--;
      }
    } else if (method == "next") {
      if (_listTitleIndex == listTitles.length - 1) {
        _listTitleIndex = 0;
      } else {
        _listTitleIndex++;
      }
    }
    _selectedTitle = listTitles[_listTitleIndex];
    print(_selectedTitle);
  }

  void addGoals(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    http.Response jsonResponse = await authServices.addGoals(
      email!,
      _selectedTitle,
    );
    _listTitleIndex = 0;
    GoalsData result = new GoalsData.fromJson(jsonDecode(jsonResponse.body));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  void handleCompleteProfile(BuildContext context) async {}
}
