import 'package:dartz/dartz.dart';
import 'package:streaming_music/error/failure.dart';
import 'package:streaming_music/features/auth/domain/repository/auth_repostitory.dart';

class ForgotPasswordUseCase {
  final AuthRepository authRepository;
  ForgotPasswordUseCase(this.authRepository);

  Future<Either<Failure, void>> call(String email){
    return authRepository.forgotPassword(email);
  }

}