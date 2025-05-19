import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/appColors.dart';
import '../core/utils/validation.dart';
import '../viewModel/signUpViewModel.dart';
import '../widgets/customTextField.dart';
import 'login.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login()), // Assuming you have a Login screen
              );
            },
            icon: Icon(Icons.arrow_circle_left_outlined, color: AppColors.primaryColor, size: 40),
          ),
        ),
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.darkBlue,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 40),
                Container(
                  padding: EdgeInsets.only(left: 100),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.only(left: 50),
                  child: Text(
                    'Please sign up to get started',
                    style: TextStyle(color: AppColors.primaryColor, fontSize: 18),
                  ),
                ),
                SizedBox(height: 90),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(9),
                        bottomRight: Radius.circular(9),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          customTextField(
                            labelText: 'Name',
                            controller: authViewModel.nameController,
                            keyboardType: TextInputType.text,
                            prefixIcon: Icon(Icons.person, color: AppColors.darkBlue),
                            hintText: 'Enter your name',
                          ),
                          SizedBox(height: 10),
                          customTextField(
                            labelText: 'Email',
                            controller: authViewModel.emailController,
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: Icon(Icons.email, color: AppColors.darkBlue),
                            validator: Validators.validateEmail,
                            hintText: 'Enter your email',
                          ),
                          SizedBox(height: 10),
                          customTextField(
                            labelText: 'Password',
                            controller: authViewModel.passwordController,
                            obscureText: !authViewModel.isPasswordVisible,
                            suffixIcon: IconButton(
                              icon: Icon(
                                authViewModel.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                color: AppColors.darkBlue,
                              ),
                              onPressed: authViewModel.togglePasswordVisibility,
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            prefixIcon: Icon(Icons.password, color: AppColors.darkBlue),
                            validator: Validators.validatePassword,
                            hintText: 'Enter your password',
                          ),
                          SizedBox(height: 10),
                          customTextField(
                            labelText: 'Confirm Password',
                            controller: authViewModel.confirmpasswordController,
                            obscureText: !authViewModel.isConfirmPasswordVisible,
                            suffixIcon: IconButton(
                              icon: Icon(
                                authViewModel.isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                color: AppColors.darkBlue,
                              ),
                              onPressed: authViewModel.toggleConfirmPasswordVisibility,
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            prefixIcon: Icon(Icons.password, color: AppColors.darkBlue),
                            validator: Validators.validatePassword,
                            hintText: 'Confirm password',
                          ),
                          SizedBox(height: 100),
                          // Show loading indicator if the registration is in progress
                          if (authViewModel.isLoading)
                            CircularProgressIndicator(),
                          SizedBox(height: 10),
                          // Show error message if there's one
                          if (authViewModel.errorMessage != null)
                            Text(
                              authViewModel.errorMessage!,
                              style: TextStyle(color: Colors.red),
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.orange,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 137, vertical: 14),
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(color: AppColors.primaryColor, fontSize: 20),
                                  ),
                                ),
                                onTap: () {
                                  authViewModel.registerWithEmail(context);  // Pass context here
                                },
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
        ),
      ),
    );
  }
}
