import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:flutter/material.dart';
import '../core/utils/dialogUtils.dart';
import '../model/signUp.dart';

class AuthViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  bool _isConfirmPasswordVisible = false;

  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;

  String? errorMessage;

  Future<void> registerWithEmail(BuildContext context) async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmpasswordController.text.trim();

    errorMessage = null;


    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      errorMessage = "Please fill in all fields.";
      notifyListeners();
      return;
    }

    if (password != confirmPassword) {
      errorMessage = "Passwords do not match.";
      notifyListeners();
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      DialogUtils.showLoading(context: context, message: "Registering...");

      final credential = await fb_auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = credential.user?.uid;
      if (uid != null) {
        DialogUtils.showLoading(context: context, message: "Saving data...");

        final user = AppUser(name: name, email: email);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .set(user.toMap());

        DialogUtils.hideLoading(context);

        await Future.delayed(Duration(milliseconds: 200));

        DialogUtils.showMessage(
          context: context,
          message: "Registration successful!",
          title: "Success",
          posActionName: "Go to Home",
          posAction: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        );

        print("The success message has been displayed.");
      }
    } on fb_auth.FirebaseAuthException catch (e) {
      DialogUtils.hideLoading(context);

      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The email is already registered.';
      } else {
        errorMessage = 'Registration error: ${e.message}';
      }

      DialogUtils.showMessage(
        context: context,
        message: errorMessage ?? "An unknown error occurred.",
        title: "error",
        negActionName: "try again",
      );
    } catch (e) {
      DialogUtils.hideLoading(context);
      errorMessage = 'An unexpected error occurred: $e';

      DialogUtils.showMessage(
        context: context,
        message: errorMessage ?? "An unknown error occurred.",
        title: "error",
      );
    } finally {
      _isLoading = false;
      notifyListeners();
      if (context.mounted) DialogUtils.hideLoading(context);
    }
  }

  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    notifyListeners();
  }
  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
}

