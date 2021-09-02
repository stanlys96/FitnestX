import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitness_app/ui/widgets/text_field_custom.dart';
import 'package:fitness_app/ui/screens/auth/welcome_screen/main.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: Column(
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
                    ),
                    SizedBox(height: 15),
                    TextFieldCustom(
                      icon: Icon(Icons.person_outline),
                      hintText: "Password",
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                    ),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WelcomePage()),
                      );
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
                      Text(
                        ' Register',
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
  }
}
