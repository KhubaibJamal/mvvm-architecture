import 'package:flutter/material.dart';
import 'package:mvvm/resources/component/round_button.dart';
import 'package:mvvm/utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ValueNotifier<bool> _obscureText = ValueNotifier<bool>(true);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obscureText.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                focusNode: emailFocusNode,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(Icons.alternate_email),
                ),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                      context, emailFocusNode, passwordFocusNode);
                },
              ),
              ValueListenableBuilder(
                valueListenable: _obscureText,
                builder: ((context, value, child) {
                  return TextFormField(
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    obscureText: _obscureText.value,
                    decoration: InputDecoration(
                      hintText: "password",
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _obscureText.value = !_obscureText.value;
                        },
                        icon: Icon(
                          _obscureText.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  );
                }),
              ),

              // login button
              const SizedBox(height: 20),
              RoundButton(
                title: "Login",
                onPress: () {
                  if (emailController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Please enter email', context);
                  } else if (passwordController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        'Please enter password', context);
                  } else if (passwordController.text.length < 6) {
                    Utils.flushBarErrorMessage(
                        'Please enter 6 digit password', context);
                  } else {
                    print("done!!");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
