import 'package:flutter/material.dart';
import 'package:fitness_app/ui/screens/auth/onboarding_screen/main.dart';
import 'package:provider/provider.dart';
import 'provider/providers.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GettingStartedChangeNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegisterChangeNotifier(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitnestX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => OnboardingScreen(),
      },
    );
  }
}
