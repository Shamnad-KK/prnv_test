import 'package:flutter/material.dart';
import 'package:prnv_test/widgets/bottom_nav_widget.dart';

import '../db/auth_db.dart';
import '../helper/preference_manager.dart';
import '../model/user_model.dart';

class SignUpController extends ChangeNotifier {
  AuthDB authDB = AuthDB();
  PreferenceManager manager = PreferenceManager();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  bool get isObscure => _isObscure;

  void signUp(BuildContext context) async {
    final UserModel user = UserModel(
      email: emailController.text,
      password: passwordController.text,
    );
    await authDB.signUp(user).then((value) {
      if (value == true) {
        manager.setToken(true);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (ctx) => const BottomNavBar(),
            ),
            (route) => false);
      }
    });
    emailController.clear();
    passwordController.clear();
    notifyListeners();
  }

  void setObscureTextVisibility() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  String? emailValidation(String? value) {
    if (value!.isEmpty) {
      return "Please enter your email address";
    } else if (!value.contains('@') && !value.contains('.')) {
      return "Please enter a valid email address";
    }
    return null;
  }

  String? passwordValidation(String? value) {
    if (value!.isEmpty) {
      return "Please enter your password";
    } else if (value.length < 6) {
      return "Password should contain minimum 6 characters";
    }
    return null;
  }
}
