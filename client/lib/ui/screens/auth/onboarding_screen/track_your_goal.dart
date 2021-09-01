import 'package:fitness_app/provider/getting_started/getting_started_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../register_screen/main.dart';
import 'package:provider/provider.dart';

class TrackYourGoal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<GettingStartedChangeNotifier>(
          builder: (context, provider, _) {
            return Stack(
              alignment: Alignment.bottomRight,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/${provider.imageUrl}',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.65,
                      fit: BoxFit.fill,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            provider.title,
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            provider.description,
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Color(0xFF7B6F72),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 15.0,
                    bottom: 10.0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (provider.index == provider.listTitles.length - 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      } else {
                        provider.moveToNextPage();
                      }
                    },
                    child: CircularPercentIndicator(
                      animateFromLastPercent: true,
                      animation: true,
                      animationDuration: 700,
                      percent: provider.percentIndicator,
                      radius: 75,
                      backgroundColor: Colors.transparent,
                      progressColor: Color(0xFF92A3FD),
                      lineWidth: 3,
                      center: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                const Color(0xFF9DCEFF),
                                const Color(0xFF92A3FD),
                              ],
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(1.0, 0.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child:
                            Image.asset('assets/icons/arrow_right_white.png'),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
