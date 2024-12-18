import 'package:flutter/material.dart';
import '../features/auth/presentation/login_page.dart';
import '../features/auth/presentation/sign_up_screen.dart';
import '../features/auth/presentation/signup_or_signin.dart';
import '../features/intro/pages/get_started.dart';
import '../service_locator.dart';

class AppRoute{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutePath.loginPage:
        return MaterialPageRoute(builder: (_) => SigninPage());
      case AppRoutePath.welcomePage:
        return MaterialPageRoute(builder: (_) =>  const GetStartedPage());
      case AppRoutePath.signUpPage:
        return MaterialPageRoute(builder: (_) => SignupPage());
      case AppRoutePath.singUpOrSignInPage:
        return MaterialPageRoute(builder: (_) => const SignupOrSigninPage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}

class AppRoutePath{
  static const String welcomePage = '/welcome-page';
  static const String loginPage = '/login-page';
  static const String signUpPage = '/sign-up-page';
  static const String singUpOrSignInPage = '/singup-or-signin-page';
}