import 'package:dartz/dartz.dart';
import 'package:streaming_music/features/auth/domain/repository/auth_repostitory.dart';

import '../../../../error/failure.dart';
import '../entity/user_entity.dart';

class GetUserUseCase{
  AuthRepository authRepository;
  GetUserUseCase({required this.authRepository});
  Future<Either<Failure, User>> call(){
    return authRepository.getUser();
  }
}