import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:streaming_music/features/auth/data/Repositories/auth_repositories_impl.dart';
import 'package:streaming_music/features/auth/domain/repository/auth_repostitory.dart';
import 'package:streaming_music/features/auth/domain/use_case/forgot_password_use_case.dart';
import 'package:streaming_music/features/auth/domain/use_case/register_usecase.dart';
import 'features/auth/data/RemoteDataSource/auth_remote_datasource.dart';
import 'features/auth/domain/use_case/login_usecase.dart';

// Khởi tạo instance của GetIt
final getIt = GetIt.instance;

void setupDependencies() {
  // Đăng ký Dio
  getIt.registerLazySingleton<Dio>(() => Dio());

  // Đăng ký AuthRemoteDataSource
  getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(getIt<Dio>()));

  // Đăng ký AuthRepository
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()));

  // Đăng ký LoginUseCase
  getIt.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(getIt<AuthRepository>()));

  // Đăng ký LoginUseCase
  getIt.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(getIt<AuthRepository>()),);

  getIt.registerLazySingleton<ForgotPasswordUseCase>(
    () => ForgotPasswordUseCase(getIt<AuthRepository>()),
  );
  

    
}
