import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streaming_music/features/auth/domain/repository/auth_repostitory.dart';
import 'package:streaming_music/features/auth/domain/use_case/forgot_password_use_case.dart';
import 'package:streaming_music/features/auth/domain/use_case/login_usecase.dart';
import 'package:streaming_music/features/auth/domain/use_case/register_usecase.dart';
import 'package:streaming_music/features/auth/presentation/blocs/auth_bloc.dart';
import '../../../component/background.dart';
import '../../../component/responsive.dart';
import '../../../service_locator.dart';
import '../../../widget/login/login_form.dart';
import '../../../widget/login/login_screen_top.dart';



class LoginPage extends StatelessWidget {
  const LoginPage({Key? key, required this.authRepository}) : super(key: key);
  final AuthRepository authRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(
        loginUseCase: getIt<LoginUseCase>(), 
        registerUseCase: getIt<RegisterUseCase>(), 
        forgotPasswordUseCase: getIt<ForgotPasswordUseCase>()),
    child: Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileLoginPage(),
          desktop: Row(
            children: [
              const Expanded(
                child: LoginScreenTopImage(),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 450,
                      child: LoginForm(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}

class MobileLoginPage extends StatelessWidget {
  const MobileLoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const LoginScreenTopImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoginForm(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
