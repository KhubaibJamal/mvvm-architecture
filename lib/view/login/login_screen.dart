import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Utils.flutterToast("No Internet connection");
            Utils.flushBar("No internet connection", context);
          },
          child: Text("Login"),
        ),
      ),
    );
  }
}
