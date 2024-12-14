import 'package:dartz/dartz.dart';
import 'package:streaming_music/error/failure.dart';
import 'package:streaming_music/features/auth/domain/entity/user_entity.dart';
import 'package:streaming_music/features/auth/domain/repository/auth_repostitory.dart';

class LoginUseCase{
  AuthRepository authRepository;
  LoginUseCase(this.authRepository);

  Future<Either<Failure, User>> call(String email, String password){
    return authRepository.login(email, password);
  }
}