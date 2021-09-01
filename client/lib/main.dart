import 'package:flutter/material.dart';
import './ui/screens/auth/onboarding_screen/main.dart';
import 'package:provider/provider.dart';
import './provider/getting_started/getting_started_change_notifier.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GettingStartedChangeNotifier(),
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
