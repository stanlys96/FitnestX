part of 'main.dart';

class GoalsPage extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();
  List<String> imageUrl = [
    "assets/images/improve_shape.png",
    "assets/images/lean_and_tone.png",
    "assets/images/lose_fat.png"
  ];
  List<String> description = [
    "I have a low amount of body fat and need/want to build more muscle",
    "I'm \"skinny fat\". Looks thin but have no shape. I want to learn adding muscle the right way",
    "I have over 20 lbs to lose. I want to drop all these fat and gain muscle mass",
  ];
  List<String> titles = [
    "Improve Shape",
    "Lean & Tone",
    "Lose Fat",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "What is your goal?",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "It will help us to choose the best\nprogram for you",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      buttonCarouselController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Color(0xFFDFE5FE),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: CarouselSlider(
                      items: [
                        for (int i = 0; i < titles.length; i++) ...[
                          GoalCard(
                            title: titles[i],
                            description: description[i],
                            imageUrl: imageUrl[i],
                          ),
                        ]
                      ],
                      carouselController: buttonCarouselController,
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * 0.6,
                        enlargeCenterPage: true,
                        autoPlay: false,
                        viewportFraction: 0.9,
                        aspectRatio: 2.0,
                        initialPage: 0,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      buttonCarouselController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Color(0xFFDFE5FE),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 40),
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
                    child: Text(
                      'Confirm',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GoalCard extends StatelessWidget {
  String? title;
  String? description;
  String? imageUrl;

  GoalCard(
      {@required this.title,
      @required this.description,
      @required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
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
      child: Column(
        children: [
          SizedBox(height: 25),
          Image.asset(
            imageUrl!,
            height: MediaQuery.of(context).size.height * 0.35,
          ),
          SizedBox(height: 20),
          Text(
            title!,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          Container(
            width: 50,
            child: Divider(
              color: Colors.white,
              thickness: 2,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 30, right: 30),
              child: Text(
                description!,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  height: 1.3,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
