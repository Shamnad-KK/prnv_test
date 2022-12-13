import 'package:flutter/material.dart';
import 'package:prnv_test/controller/home_controller.dart';
import 'package:prnv_test/view/profile/widgets/profile_row_widget.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const ProfileRowWidget(text: 'Edit Profile', icon: Icons.edit),
              const ProfileRowWidget(text: 'My Wallet', icon: Icons.wallet),
              const ProfileRowWidget(
                  text: 'Refer and Earn', icon: Icons.card_giftcard),
              const ProfileRowWidget(text: 'About', icon: Icons.info),
              InkWell(
                onTap: () {
                  Provider.of<HomeController>(context, listen: false)
                      .logout(context);
                },
                child:
                    const ProfileRowWidget(text: 'Log out', icon: Icons.logout),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
