import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newflutter/view/forgetPassword.dart';
import 'package:newflutter/view/login.dart';
import 'package:newflutter/view/onboarding1.dart';
import 'package:newflutter/view/onboarding2.dart';
import 'package:newflutter/view/onboarding3.dart';
import 'package:newflutter/view/signup.dart';
import 'package:newflutter/view/splachScreen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Login(),
      routes: {
        '/splachScreen': (context) => const SplachScreen(),
        '/onboarding1': (context) => const Onboarding1(),
        '/onboarding2': (context) => const Onboarding2(),
        '/onboarding3': (context) => const Onboarding3(),
        '/login': (context) => const Login(),
        '/signup': (context) => SignUp(),
        '/forgetPassword': (context) => const ForgetPassword(),
      },
    );
  }
}