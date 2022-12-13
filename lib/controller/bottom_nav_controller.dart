import 'package:flutter/material.dart';
import 'package:prnv_test/view/cart/cart_screen.dart';
import 'package:prnv_test/view/notification/notification_screen.dart';
import 'package:prnv_test/view/profile/profile_screen.dart';

import '../view/home/home_screen.dart';

class BottomNavController extends ChangeNotifier {
  final List<Widget> _pageList = [
    const HomeScreen(),
    const CartScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  List<Widget> get pageList => _pageList;

  int currentIndex = 0;

  void setNewIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
