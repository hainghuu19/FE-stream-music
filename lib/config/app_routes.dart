import 'package:flutter/material.dart';
import 'package:streaming_music/features/auth/domain/repository/auth_repostitory.dart';
import 'package:streaming_music/features/auth/presentation/sign_up_screen.dart';
import 'package:streaming_music/features/auth/presentation/signup_or_signin.dart';

import '../features/auth/presentation/login_page.dart';
import '../service_locator.dart';

class AppRoute{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutePath.loginPage:
        return MaterialPageRoute(builder: (_) => LoginPage(authRepository: getIt<AuthRepository>() ));
      case AppRoutePath.welcomePage:
        return MaterialPageRoute(builder: (_) =>  const WelcomeScreen());
      case AppRoutePath.signUpPage:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
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
}