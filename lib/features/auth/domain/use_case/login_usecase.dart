import 'package:dartz/dartz.dart';
import 'package:streaming_music/error/failure.dart';
import 'package:streaming_music/features/auth/domain/repository/auth_repostitory.dart';

class LoginUseCase{
  AuthRepository authRepository;
  LoginUseCase(this.authRepository);

  Future<Either<Failure, String>> call(String username, String password){
    return authRepository.login(username, password);
  }
}