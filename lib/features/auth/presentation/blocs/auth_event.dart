abstract class AuthenticationEvent{}

class LoginEvent extends AuthenticationEvent{
  final String email;
  final String password;
  LoginEvent({required this.email, required this.password});
}

class RegisterEvent extends AuthenticationEvent{
  final String username;
  final String email;
  final String password;
  RegisterEvent({required this.username, required this.email, required this.password});
}

class ForgotPasswordEvent extends AuthenticationEvent{
  final String email;
  ForgotPasswordEvent({required this.email});
}

class AlreadyHaveAccountEvent extends AuthenticationEvent{}