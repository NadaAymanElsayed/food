import 'package:flutter/material.dart';
import 'package:newflutter/view/login.dart';
import 'package:newflutter/view/onboarding1.dart';
import 'package:newflutter/view/onboarding2.dart';
import 'package:newflutter/view/onboarding3.dart';
import 'package:newflutter/view/splachScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplachScreen(),
      routes: {
        '/splachScreen': (context) => const SplachScreen(),
        '/onboarding1': (context) => const Onboarding1(),
        '/onboarding2': (context) => const Onboarding2(),
        '/onboarding3': (context) => const Onboarding3(),
        '/login': (context) => const Login(),

      },
    );
  }
}