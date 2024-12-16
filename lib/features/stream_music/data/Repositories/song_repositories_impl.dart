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
  Future<Uint8List> getSong(int songId) async {
    return await songRemoteDataSource.getSong(songId);

  }

@override
Future<Either<Failure, bool>> addOrRemoveFavoriteSong({required String songId}) {
    // TODO: implement addOrRemoveFavoriteSong
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, void>> getPlaylist() {
    // TODO: implement getPlaylist
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, List<int>>> getUserFavoriteSongs({int songId}) {
    // TODO: implement getUserFavoriteSongs
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, bool>> isSongFavorite({required String songId}) {
    // TODO: implement isSongFavorite
    throw UnimplementedError();
  }
  
}