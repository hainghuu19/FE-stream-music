import 'package:dartz/dartz.dart';
import '../../../../error/failure.dart';
import '../entity/user_entity.dart';

abstract class AuthRepository{
  Future<Either<Failure, User>> login(String email, String password);
  Future<Either<Failure, void>> register(String username, String email, String password);
  Future<Either<Failure, void>> forgotPassword(String email);
}