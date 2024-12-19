import 'package:flutter/foundation.dart';
import 'package:streaming_music/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:streaming_music/features/stream_music/data/RemoteDataSource/song_remote_data_source.dart';
import 'package:streaming_music/service/song_service.dart';
import '../../domain/entity/song_entity.dart';
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
    
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, void>> getPlaylist() {
    
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, List<int>>> getUserFavoriteSongs({required int userId}) {
    
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, bool>> isSongFavorite({required int songId}) {
    
    throw UnimplementedError();
  }

@override
Future<Either<Exception, List<Song>>> getAllSongs() async {
    try {
      final songModels = await songRemoteDataSource.getAllSongs();
      // Chuyển từ SongModel sang Song Entity
      final songs = songModels
          .map((model) => Song(
                songId: model.songId,
                title: model.title,
                audioFilePath: model.audioFilePath,
                artistId: model.artistId,
                albumTitle: model.albumTitle,
                genre: model.genre,
                duration: model.duration,
                releaseDate: model.releaseDate,
                playCount: model.playCount,
                isFavorite: model.isFavorite,
                artistName: model.artistName,
              ))
          .toList();
      return Right(songs);
    } catch (e) {
      return Left(Exception('Failed to fetch songs: $e'));
    }
  }
  
}