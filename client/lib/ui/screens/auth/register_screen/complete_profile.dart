part of 'main.dart';

class CompleteProfile extends StatefulWidget {
  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile>
    with RestorationMixin {
  String restorationId = 'main';
  final RestorableDateTime _selectedDate = RestorableDateTime(DateTime.now());
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(1944, 1, 1),
          lastDate: DateTime.now(),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        Provider.of<RegisterChangeNotifier>(context, listen: false)
                .dateOfBirth =
            "${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<RegisterChangeNotifier>(
          builder: (context, provider, _) {
            return Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/complete_profile.png',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.425,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                    child: Column(
                      children: [
                        Text(
                          "Let's complete your profile",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "It will help us to know more about you!",
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 10),
                        DropdownField(
                          data: provider.listGender,
                          provider: provider,
                        ),
                        if (provider.genderError != "") ...[
                          SizedBox(height: 5),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              provider.genderError,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                        SizedBox(height: provider.genderError != "" ? 10 : 15),
                        DateTimeField(
                          icon: Icon(Icons.calendar_today, size: 20),
                          title: provider.dateOfBirth,
                          suffixIcon:
                              Icon(Icons.calendar_today_outlined, size: 20),
                          suffixOnPressed:
                              _restorableDatePickerRouteFuture.present,
                        ),
                        if (provider.dateOfBirthError != "") ...[
                          SizedBox(height: 5),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              provider.dateOfBirthError,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                        SizedBox(
                            height: provider.dateOfBirthError != "" ? 10 : 15),
                        Row(
                          children: [
                            Expanded(
                              child: TextFieldCustom(
                                icon: Image.asset(
                                  'assets/icons/weight-scale.png',
                                  height: 20,
                                  width: 20,
                                ),
                                hintText: "Your Weight",
                                controller: provider.weightController,
                                inputNumber: true,
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              height: MediaQuery.of(context).size.height / 15,
                              width: MediaQuery.of(context).size.width / 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: LinearGradient(
                                    colors: [
                                      const Color(0xFFEEA4CE),
                                      const Color(0xFFC58BF2),
                                    ],
                                    begin: FractionalOffset(0.0, 0.0),
                                    end: FractionalOffset(1.0, 0.0),
                                    stops: [0.0, 1.0],
                                    tileMode: TileMode.clamp),
                              ),
                              child: Center(
                                child: Text(
                                  'KG',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        if (provider.weightError != "") ...[
                          SizedBox(height: 5),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              provider.weightError,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                        SizedBox(height: provider.weightError != "" ? 10 : 15),
                        Row(
                          children: [
                            Expanded(
                              child: TextFieldCustom(
                                icon: Image.asset(
                                  'assets/icons/height.png',
                                  height: 20,
                                  width: 20,
                                ),
                                hintText: "Your Height",
                                controller: provider.heightController,
                                inputNumber: true,
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              height: MediaQuery.of(context).size.height / 15,
                              width: MediaQuery.of(context).size.width / 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: LinearGradient(
                                    colors: [
                                      const Color(0xFFEEA4CE),
                                      const Color(0xFFC58BF2),
                                    ],
                                    begin: FractionalOffset(0.0, 0.0),
                                    end: FractionalOffset(1.0, 0.0),
                                    stops: [0.0, 1.0],
                                    tileMode: TileMode.clamp),
                              ),
                              child: Center(
                                child: Text(
                                  'CM',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        if (provider.heightError != "") ...[
                          SizedBox(height: 5),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              provider.heightError,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                        SizedBox(height: provider.heightError != "" ? 10 : 15),
                        GestureDetector(
                          onTap: () {
                            print('Hey');
                            provider.completeProfile(context);
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Next ',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.white,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
