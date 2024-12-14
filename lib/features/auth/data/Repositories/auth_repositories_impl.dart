import 'package:dartz/dartz.dart';
import 'package:streaming_music/error/failure.dart';
import 'package:streaming_music/features/auth/data/RemoteDataSource/auth_remote_datasource.dart';
import 'package:streaming_music/features/auth/domain/repository/auth_repostitory.dart';
import '../../domain/entity/user_entity.dart';

class AuthRepositoryImpl extends AuthRepository{
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try{
      final user = await authRemoteDataSource.login(email, password);
      return Right(user);
    }catch(e){
      return Left(ServerFailure(message: 'Failed to login'));

    }
  }

  @override
  Future<Either<Failure, void>> register(String username, String email, String password) async {
    try{
      await authRemoteDataSource.register(username, email, password);
      return const Right(null);
    } catch(e){
      return Left(ServerFailure(message: 'Failed to register'));
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword(String email)async{
    try{
      await authRemoteDataSource.forgotPassword(email);
      return const Right(null);
    }catch(e){
      return Left(ServerFailure(message: 'Failed to reset password'));
    }
  }

}