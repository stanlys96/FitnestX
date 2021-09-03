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
                  height: MediaQuery.of(context).size.height - 80,
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                    bottom: 20,
                  ),
                  child: Column(
                    children: [
                      Expanded(
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
                            const SizedBox(height: 15),
                            TextFieldCustom(
                              icon: Icon(Icons.person_outline),
                              hintText: "First Name",
                              controller: provider.firstNameController,
                            ),
                            SizedBox(height: 15),
                            TextFieldCustom(
                              icon: Icon(Icons.person_outline),
                              hintText: "Last Name",
                              controller: provider.lastNameController,
                            ),
                            SizedBox(height: 15),
                            TextFieldCustom(
                                icon: Icon(Icons.mail_outline),
                                hintText: "Email",
                                controller: provider.emailController),
                            SizedBox(height: 15),
                            TextFieldCustom(
                              icon: Icon(Icons.person_outline),
                              hintText: "Password",
                              controller: provider.passwordController,
                              suffixIcon: Icon(Icons.remove_red_eye_outlined),
                            ),
                            SizedBox(height: 10),
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
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              provider.handleRegister(context);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
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
                                child: Text(
                                  'Register',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
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
                              Text(
                                ' Login',
                                style: GoogleFonts.poppins(
                                  color: Color(0xFFC58BF2),
                                ),
                              ),
                            ],
                          )
                        ],
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
