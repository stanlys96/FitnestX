part of 'providers.dart';

class RegisterChangeNotifier with ChangeNotifier {
  int _listTitleIndex = 0;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _firstNameController = new TextEditingController();
  final _lastNameController = new TextEditingController();
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();
  String dateOfBirth = '';
  final _weightController = new TextEditingController();
  final _heightController = new TextEditingController();
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
    GoalsData result = new GoalsData.fromJson(jsonDecode(jsonResponse.body));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  void handleCompleteProfile(BuildContext context) async {}
}
