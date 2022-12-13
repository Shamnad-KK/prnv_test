import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashController =
        Provider.of<SplashController>(context, listen: false);
    splashController.checkUserState(context);
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
