import 'package:streaming_music/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:streaming_music/features/stream_music/data/RemoteDataSource/song_remote_data_source.dart';
import '../../domain/repositories/i_song_repository.dart';

class SongRepositoryImpl extends SongRepository{
  final SongRemoteDataSource songRemoteDataSource;

  SongRepositoryImpl(this.songRemoteDataSource);

  @override
  Future<Either<Failure, void>> playSong(int songId) async {
    try{
    await songRemoteDataSource.getSong(songId);
    return const Right(null);
    } catch(e){
      return Left(ServerFailure(message: 'Failed to login'));
    }

  }
  
}