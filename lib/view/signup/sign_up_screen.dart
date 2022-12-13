import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/signup_controller.dart';
import '../../widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpController =
        Provider.of<SignUpController>(context, listen: false);
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
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
                  controller: signUpController.emailController,
                  hint: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (p0) => signUpController.emailValidation(p0),
                ),
                const SizedBox(height: 10),
                Consumer<SignUpController>(
                  builder: (BuildContext context, value, Widget? child) =>
                      CustomTextField(
                    controller: value.passwordController,
                    hint: 'Password',
                    validator: (p0) => value.passwordValidation(p0),
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
                    const Text("Already have an account?"),
                    TextButton(
                        onPressed: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            )),
                        child: const Text('Login'))
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      signUpController.signUp(context);
                    }
                  },
                  child: const Text('Sign Up'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
