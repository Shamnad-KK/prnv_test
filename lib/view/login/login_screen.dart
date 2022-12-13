import 'package:flutter/material.dart';
import 'package:prnv_test/view/signup/sign_up_screen.dart';
import 'package:provider/provider.dart';

import '../../controller/login_controller.dart';
import '../../widgets/custom_text_field.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController =
        Provider.of<LoginController>(context, listen: false);
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: loginController.emailController,
                  hint: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (p0) => loginController.emailValidation(p0),
                ),
                const SizedBox(height: 10),
                Consumer<LoginController>(
                  builder: (BuildContext context, value, Widget? child) =>
                      CustomTextField(
                    controller: loginController.passwordController,
                    hint: 'Password',
                    validator: (p0) => loginController.passwordValidation(p0),
                    obscureText: value.isObscure,
                    suffixIcon: InkWell(
                      onTap: () {
                        value.setObscureTextVisibility();
                      },
                      child: Icon(
                        value.isObscure
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Dont't have an account?"),
                    TextButton(
                        onPressed: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            )),
                        child: const Text('Sign up'))
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      loginController.logIn(context);
                    }
                  },
                  child: const Text('Log in'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
