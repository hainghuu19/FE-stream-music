abstract class AuthenticationState{}

class AuthInitial extends AuthenticationState{}

class AuthLoading extends AuthenticationState{}

class AuthSuccess extends AuthenticationState{
  final String successMessage;
  AuthSuccess({required this.successMessage});
}

class AuthFailure extends AuthenticationState{
  final String failMessage;
  AuthFailure({required this.failMessage});
}
