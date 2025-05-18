
import 'package:flutter/material.dart';

import 'onboarding1.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), (){
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context)=> const Onboarding1()),
      );
    });
    return Scaffold(
      body: Center(
        child: Image.asset('assets/splachScreen.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,),
      ),
    );
  }
}