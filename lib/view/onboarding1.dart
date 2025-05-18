import 'package:flutter/material.dart';

import '../constant/appColors.dart';
import 'onboarding2.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Row(
            children: [
              Image.asset('assets/onboarding1.png'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('All your favorites',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text(
                  '''Get all your favorite foods in one place.
You just place the order — we’ll do the rest.''',
                  style:TextStyle( height: 1.5) ,
                )
              ],
            ),
          ),
          SizedBox(height: 100,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 150, vertical: 18),
                  child: Text('Next',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 20
                    ),
                  ),
                ),
                onTap: (){
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Onboarding2()),);
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 150, vertical: 18),
                  child: Text('Skip',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20
                    ),
                  ),
                ),
                onTap: (){},
              )
            ],
          ),

        ],
      ),
    );
  }
}
