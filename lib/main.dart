import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prnv_test/controller/bottom_nav_controller.dart';
import 'package:prnv_test/controller/cart_controller.dart';
import 'package:prnv_test/controller/home_controller.dart';
import 'package:prnv_test/controller/onboarding_controller.dart';
import 'package:prnv_test/view/splash/splash_screen.dart';
import 'package:provider/provider.dart';

import 'controller/login_controller.dart';
import 'controller/signup_controller.dart';
import 'controller/splash_controller.dart';
import 'model/user_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(UserModelAdapter().typeId)) {
    Hive.registerAdapter(UserModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignUpController()),
        ChangeNotifierProvider(create: (context) => LoginController()),
        ChangeNotifierProvider(create: (context) => SplashController()),
        ChangeNotifierProvider(create: (context) => BottomNavController()),
        ChangeNotifierProvider(create: (context) => HomeController()),
        ChangeNotifierProvider(create: (context) => CartController()),
        ChangeNotifierProvider(create: (context) => OnboardingController()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
