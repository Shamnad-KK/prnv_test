import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/bottom_nav_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final bottomnavController =
        Provider.of<BottomNavController>(context, listen: false);
    return Scaffold(
      body: context
          .watch<BottomNavController>()
          .pageList[bottomnavController.currentIndex],
      bottomNavigationBar: SizedBox(
        height: 50,
        child: BottomNavigationBar(
          iconSize: 20,
          currentIndex: bottomnavController.currentIndex,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.cart), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'Notifications'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Profile'),
          ],
          onTap: (value) {
            bottomnavController.setNewIndex(value);
          },
        ),
      ),
    );
  }
}
