import 'package:flutter/material.dart';

import '../constant/appColors.dart';
import 'login.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Row(
            children: [
              Image.asset('assets/onboarding3.png'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Free delivery offers',
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
                  padding: EdgeInsets.symmetric(horizontal: 120, vertical: 18),
                  child: Text('Get started',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 20
                    ),
                  ),
                ),
                onTap: (){
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Login()),);
                },
              )
            ],
          ),

        ],
      ),
    );
  }
}
