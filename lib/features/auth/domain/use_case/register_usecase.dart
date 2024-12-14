import 'package:dartz/dartz.dart';
import 'package:streaming_music/error/failure.dart';
import 'package:streaming_music/features/auth/domain/repository/auth_repostitory.dart';

class RegisterUseCase{
  final AuthRepository authRepository;
  RegisterUseCase(this.authRepository);

  Future<Either<Failure,void>> call(String username, String email, String password){
    return authRepository.register(email, password, username);
  }
}