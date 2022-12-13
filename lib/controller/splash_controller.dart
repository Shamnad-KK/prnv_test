// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:prnv_test/controller/onboarding_controller.dart';
import 'package:prnv_test/view/login/login_screen.dart';
import 'package:prnv_test/view/onboard/onboarding_screen.dart';
import 'package:prnv_test/widgets/bottom_nav_widget.dart';

import '../helper/preference_manager.dart';

class SplashController extends ChangeNotifier {
  PreferenceManager manager = PreferenceManager();

  void checkUserState(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    bool initialLogin = await OnboardingController().getInitialLogin(context);
    final userLogged = await manager.getToken();
    if (initialLogin == false) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const OnboardingScreen(),
          ),
          (route) => false);
    } else if (userLogged) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const BottomNavBar(),
          ),
          (route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const LogInScreen(),
          ),
          (route) => false);
    }
  }
}
