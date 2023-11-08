import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes.dart';
import 'package:mvvm/view/home/home_screen.dart';
import 'package:mvvm/view/login/login_view.dart';
import 'package:mvvm/view/sign_up/sign_up_view.dart';
import 'package:mvvm/view/splash/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (context) => const SplashView());

      case RouteName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case RouteName.login:
        return MaterialPageRoute(builder: (context) => const LoginView());

      case RouteName.signUp:
        return MaterialPageRoute(builder: (context) => const SignUpView());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No route found"),
            ),
          );
        });
    }
  }
}
