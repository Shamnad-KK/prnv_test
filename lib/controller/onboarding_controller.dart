// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:prnv_test/core/strings.dart';
import 'package:prnv_test/view/login/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingController extends ChangeNotifier {
  List<String> onboardImageList = [
    'https://img.freepik.com/premium-vector/woman-reading-book-character_151150-352.jpg?w=2000',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDNNTZajsALLBGIrRXTwUD709MnTeIIqkPAnvEy84wdm2TwiFfMVmV-Mz89femxEF3NXg&usqp=CAU',
    'https://img.freepik.com/premium-vector/young-woman-reading-paper-book-sofa-home_313242-982.jpg'
  ];

  void setInitialLogin(BuildContext context) async {
    final preference = await SharedPreferences.getInstance();
    await preference.setBool(AppStrings.INITIAL_LOGIN, true);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const LogInScreen(),
        ),
        (route) => false);
  }

  Future<bool> getInitialLogin(BuildContext context) async {
    final preference = await SharedPreferences.getInstance();
    final result = preference.getBool(AppStrings.INITIAL_LOGIN) ?? false;

    return result;
  }
}
