part of 'main.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String firstName = '';

  String lastName = '';

  String email = '';

  String password = '';

  bool isObscure = true;

  void changeObscure() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Provider.of<RegisterChangeNotifier>(context, listen: false)
          .scaffoldKey,
      body: SafeArea(
        child: Consumer<RegisterChangeNotifier>(
          builder: (context, provider, _) {
            return SingleChildScrollView(
              child: Form(
                key: provider.formKey,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 20,
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.63,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Hey there,',
                              style: GoogleFonts.poppins(fontSize: 18),
                            ),
                            Text(
                              'Create an Account',
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFieldCustom(
                              icon: Icon(Icons.person_outline),
                              hintText: "First Name",
                              controller: provider.firstNameController,
                            ),
                            if (provider.firstNameError != "") ...[
                              SizedBox(height: 5),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  provider.firstNameError,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                            SizedBox(
                                height:
                                    provider.firstNameError != "" ? 10 : 15),
                            TextFieldCustom(
                              icon: Icon(Icons.person_outline),
                              hintText: "Last Name",
                              controller: provider.lastNameController,
                            ),
                            if (provider.lastNameError != "") ...[
                              SizedBox(height: 5),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  provider.lastNameError,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                            SizedBox(
                                height: provider.lastNameError != "" ? 10 : 15),
                            TextFieldCustom(
                                icon: Icon(Icons.mail_outline),
                                hintText: "Email",
                                controller: provider.emailController),
                            if (provider.emailError != "") ...[
                              SizedBox(height: 5),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  provider.emailError,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                            SizedBox(
                                height: provider.emailError != "" ? 10 : 15),
                            TextFieldCustom(
                              icon: Icon(Icons.lock_outline),
                              hintText: "Password",
                              controller: provider.passwordController,
                              suffixIcon: isObscure
                                  ? FaIcon(FontAwesomeIcons.eyeSlash)
                                  : FaIcon(FontAwesomeIcons.eye),
                              obscure: isObscure,
                              changeIsObscure: changeObscure,
                            ),
                            if (provider.passwordError != "") ...[
                              SizedBox(height: 5),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  provider.passwordError,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                            Row(
                              children: [
                                Checkbox(value: true, onChanged: (val) {}),
                                Expanded(
                                  child: Text(
                                    'By continuing you accept our Privacy Policy and Term of Use',
                                    style: GoogleFonts.poppins(
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                print('register');
                                provider.handleRegister(context);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  gradient: const LinearGradient(
                                      colors: [
                                        const Color(0xFF9DCEFF),
                                        const Color(0xFF92A3FD),
                                      ],
                                      begin: const FractionalOffset(0.0, 0.0),
                                      end: const FractionalOffset(1.0, 0.0),
                                      stops: [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                child: Center(
                                  child: provider.state != ResultState.Loading
                                      ? Text(
                                          'Register',
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )
                                      : CircularProgressIndicator(
                                          backgroundColor: Colors.white,
                                        ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    thickness: 2,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Or',
                                  style: GoogleFonts.poppins(),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Divider(
                                    thickness: 2,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/icons/ic_google.png'),
                                SizedBox(
                                  width: 30,
                                ),
                                Image.asset('assets/icons/ic_facebook.png'),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account?',
                                  style: GoogleFonts.poppins(),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    provider.refresh(context);
                                    Navigator.pushReplacement<void, void>(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            LoginPage(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    ' Login',
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFFC58BF2),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
