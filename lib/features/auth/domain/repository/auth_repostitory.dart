import 'package:dartz/dartz.dart';
import '../../../../error/failure.dart';
import '../entity/user_entity.dart';

abstract class AuthRepository{
  Future<Either<Failure, String>> login(String username, String password);
  Future<Either<Failure, void>> register(String username, String email, String password);
  Future<Either<Failure, void>> forgotPassword(String email);
  Future<Either<Failure, User>> getUser();
}