import 'package:dartz/dartz.dart';
import 'package:streaming_music/error/failure.dart';
import 'package:streaming_music/features/auth/data/RemoteDataSource/auth_remote_datasource.dart';
import 'package:streaming_music/features/auth/domain/repository/auth_repostitory.dart';
import '../../domain/entity/user_entity.dart';

class AuthRepositoryImpl extends AuthRepository{
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, String>> login(String username, String password) async {
    try{
      final token = await authRemoteDataSource.login(username, password);

      if (token.isEmpty) {
        return Left(ServerFailure(message: 'Invalid token received'));
      }
      return Right(token);
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

@override
Future<Either<Failure, User>> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

}