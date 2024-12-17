import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:streaming_music/features/auth/data/Repositories/auth_repositories_impl.dart';
import 'package:streaming_music/features/auth/domain/repository/auth_repostitory.dart';
import 'package:streaming_music/features/auth/domain/use_case/forgot_password_use_case.dart';
import 'package:streaming_music/features/auth/domain/use_case/register_usecase.dart';
import 'package:streaming_music/features/stream_music/data/RemoteDataSource/song_remote_data_source.dart';
import 'package:streaming_music/features/stream_music/data/Repositories/song_repositories_impl.dart';
import 'package:streaming_music/features/stream_music/domain/repositories/i_song_repository.dart';
import 'package:streaming_music/features/stream_music/domain/use_case/song_use_case.dart';
import 'package:streaming_music/service/song_service.dart';
import 'features/auth/data/RemoteDataSource/auth_remote_datasource.dart';
import 'features/auth/domain/use_case/login_usecase.dart';
import 'features/profile/bloc/favorite_songs_cubit.dart';
import 'features/stream_music/domain/use_case/add_or_remove_favorite_song.dart';
import 'features/stream_music/domain/use_case/get_favorite_song.dart';
import 'features/stream_music/domain/use_case/get_play_list.dart';

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

  // new use case for song:

  getIt.registerLazySingleton<SongRemoteDataSource>(
    () => SongRemoteDataSource(getIt<Dio>()),
  );

  getIt.registerLazySingleton<AudioPlayer>(() => AudioPlayer());

  getIt.registerLazySingleton<AudioService>(
    () => AudioService(
      songRemoteDataSource: getIt<SongRemoteDataSource>(),
      audioPlayer: getIt<AudioPlayer>(),
    ),
  );

  getIt.registerLazySingleton<SongRepository>(
    () => SongRepositoryImpl(
      getIt<SongRemoteDataSource>(),
      getIt<AudioService>(),
    ),
  );
  
  getIt.registerLazySingleton<AddOrRemoveFavoriteSongUseCase>(
    () => AddOrRemoveFavoriteSongUseCase(getIt<SongRepository>()),
  );

  getIt.registerLazySingleton<GetUserFavoriteSongsUseCase>(
    () => GetUserFavoriteSongsUseCase(getIt<SongRepository>()),
  );

  getIt.registerLazySingleton<GetPlaylistUseCase>(
    () => GetPlaylistUseCase(getIt<SongRepository>()),
  );

  getIt.registerLazySingleton<GetUserFavoriteSongsUseCase>(
    () => GetUserFavoriteSongsUseCase(getIt<SongRepository>()),
  );

  getIt.registerLazySingleton<SongUseCase>(
    () => SongUseCase(getIt<SongRepository>()),
  );

  getIt.registerLazySingleton<FavoriteSongsCubit>(
    () => FavoriteSongsCubit(
    getUserFavoriteSongsUseCase: getIt<GetUserFavoriteSongsUseCase>(), 
    songRepository: getIt<SongRepository>()
    ),
  );
    
}
