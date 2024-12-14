import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streaming_music/features/auth/domain/use_case/forgot_password_use_case.dart';
import 'package:streaming_music/features/auth/domain/use_case/login_usecase.dart';
import 'package:streaming_music/features/auth/domain/use_case/register_usecase.dart';
import 'package:streaming_music/features/auth/presentation/blocs/auth_event.dart';
import 'package:streaming_music/features/auth/presentation/blocs/auth_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> { // Bloc nhan vao event va state tuong ung
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;

  AuthenticationBloc({
    required this.loginUseCase, 
    required this.registerUseCase, 
    required this.forgotPasswordUseCase
    }) : super(AuthInitial()){
      on<LoginEvent>(_onLogin);
      on<RegisterEvent>(_onRegister);
      on<ForgotPasswordEvent>(_onForgotPassword);
  }

  Future<void> _onLogin(
    LoginEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthLoading());
    final result = await loginUseCase(event.email, event.password);
    result.fold((failure) => emit(AuthFailure(failMessage: 'Fail to login! Try again')), (success) => emit(AuthSuccess(successMessage: 'Login successful!')));

  }

  Future<void> _onRegister(
    RegisterEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthLoading());
    final result = await registerUseCase(event.email, event.password, event.username);
    result.fold(
        (failure) => emit(AuthFailure(failMessage: 'Fail to login! Try again')),
        (success) => emit(AuthSuccess(successMessage: 'Login successful!')));
  }

  Future<void> _onForgotPassword(
    ForgotPasswordEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthLoading());
    final result =
        await forgotPasswordUseCase(event.email);
    result.fold(
        (failure) => emit(AuthFailure(failMessage: 'Fail to login! Try again')),
        (success) => emit(AuthSuccess(successMessage: 'Login successful!')));
  }
    

}