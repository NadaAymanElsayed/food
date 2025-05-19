
import 'package:flutter/material.dart';
import 'package:newflutter/view/login.dart';

import '../constant/appColors.dart';
import '../core/utils/validation.dart';
import '../widgets/customTextField.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading:  IconButton(onPressed: (){
              Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => Login()),);
            }, icon: Icon(Icons.arrow_circle_left_outlined, color: AppColors.primaryColor, size: 40,)),
          ),
          resizeToAvoidBottomInset: true,
          backgroundColor: AppColors.darkBlue,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 60,),
                Container(
                    padding: EdgeInsets.only(left: 100),
                    child: Text('Fotget Password',
                      style: TextStyle(color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),)),
                SizedBox(height: 40,),
                Container(
                    padding: EdgeInsets.only(left: 50),
                    child: Text('please sign in to your existing account',
                      style: TextStyle(color: AppColors.primaryColor,
                          fontSize: 15),)),
                SizedBox(height: 100,),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          customTextField(
                            labelText: 'Email',
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: Icon(Icons.email,
                                color: AppColors.darkBlue),
                            validator: Validators.validateEmail,
                            hintText: 'Enter your email',
                            style: TextStyle(color: AppColors.darkBlue, fontSize: 16),
                          ),
                          SizedBox(height: 50,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.orange,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 110, vertical: 18),
                                  child: Text('send code',
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 20
                                    ),
                                  ),
                                ),
                                onTap: (){},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
