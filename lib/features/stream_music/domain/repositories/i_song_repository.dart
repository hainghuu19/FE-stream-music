import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:streaming_music/error/failure.dart';

abstract class SongRepository{
  Future<Uint8List> getSong(int songId);
  Future<Either<Failure, bool>> addOrRemoveFavoriteSong({required String songId});
  Future<Either<Failure, List<int>>> getUserFavoriteSongs({int songId});
  Future<Either<Failure, bool>> isSongFavorite({required String songId});
  Future<Either<Failure, void>> getPlaylist();
}