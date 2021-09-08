part of 'main.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscure = true;

  void changeObscure() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<LoginChangeNotifier>(builder: (context, provider, _) {
          return SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 20,
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.63,
                    child: Form(
                      key: provider.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Hey there,',
                            style: GoogleFonts.poppins(fontSize: 18),
                          ),
                          Text(
                            'Welcome Back',
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15),
                          TextFieldCustom(
                            icon: Icon(Icons.mail_outline),
                            hintText: "Email",
                            controller: provider.emailController,
                          ),
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
                          SizedBox(height: provider.emailError != "" ? 10 : 15),
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
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            child: Text(
                              'Forgot your password?',
                              style: GoogleFonts.poppins(
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            provider.handleLogin(context);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.home,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    'Login',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
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
                              "Don't have an account yet?",
                              style: GoogleFonts.poppins(),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement<void, void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        RegisterPage(),
                                  ),
                                );
                              },
                              child: Text(
                                ' Register',
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
          );
        }),
      ),
    );
  }
}
