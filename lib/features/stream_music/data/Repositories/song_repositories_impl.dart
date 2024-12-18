import 'package:flutter/foundation.dart';
import 'package:streaming_music/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:streaming_music/features/stream_music/data/RemoteDataSource/song_remote_data_source.dart';
import 'package:streaming_music/service/song_service.dart';
import '../../domain/repositories/i_song_repository.dart';

class SongRepositoryImpl extends SongRepository{
  final SongRemoteDataSource songRemoteDataSource;
  final AudioService audioService;

  SongRepositoryImpl(this.songRemoteDataSource, this.audioService);

  @override
  Future<Either<Failure, Uint8List>> getSong(int songId) async {
    try{
      final songData = await songRemoteDataSource.getSong(songId);
      return Right(songData);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to get song'));
    }
  }

@override
Future<Either<Failure, bool>> addOrRemoveFavoriteSong({required int songId}) {
    // TODO: implement addOrRemoveFavoriteSong
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, void>> getPlaylist() {
    // TODO: implement getPlaylist
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, List<int>>> getUserFavoriteSongs({required int userId}) {
    // TODO: implement getUserFavoriteSongs
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, bool>> isSongFavorite({required int songId}) {
    // TODO: implement isSongFavorite
    throw UnimplementedError();
  }

@override
Future<Either> getAllSongs() {
    // TODO: implement getAllSongs
    throw UnimplementedError();
  }
  
}