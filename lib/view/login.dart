import 'package:flutter/material.dart';
import 'package:newflutter/view/forgetPassword.dart';
import 'package:newflutter/view/signup.dart';
import '../constant/appColors.dart';
import '../core/utils/validation.dart';
import '../widgets/customTextField.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                    child: Text('Log in',
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
                          SizedBox(height: 20,),
                          customTextField(
                              labelText: 'Password',
                              controller: passwordController,
                              obscureText: !isPasswordVisible, // لاحظ هنا معكوس
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                  color: AppColors.darkBlue,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              prefixIcon: Icon(Icons.password,
                                  color: AppColors.darkBlue),
                              validator: Validators.validatePassword,
                              hintText: 'Enter your password',
                              style: TextStyle(color: AppColors.darkBlue, fontSize: 16)
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 60.0, right: 50),
                                child: Text('Remember me',
                                  style: TextStyle(
                                      fontSize: 15
                                  ),),
                              ),
                              InkWell(
                                  onTap: (){
                                    Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) => ForgetPassword()),);
                                  },
                                  child: Text('Forget Password',
                                    style: TextStyle(color: AppColors.orange, fontSize: 15),)
                              )

                            ],
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
                                  padding: EdgeInsets.symmetric(horizontal: 133, vertical: 18),
                                  child: Text('LOG IN',
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 20
                                    ),
                                  ),
                                ),
                                onTap: (){},
                              )
                            ],
                          ),
                          SizedBox(height: 15,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text("Don't have account ?"),
                                  SizedBox(height: 48, width: 20,),
                                  InkWell(
                                    onTap: (){
                                      Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) => SignUp()),);
                                    },
                                    child: Text('SIGN UP',
                                      style: TextStyle(
                                          color: AppColors.orange
                                      ),),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
