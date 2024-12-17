import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:streaming_music/error/failure.dart';

abstract class SongRepository{
  Future<Either<Failure, Uint8List>> getSong(int songId);     // note getSong here return Uint8List -> it's for play song feature
  Future<Either<Failure, bool>> addOrRemoveFavoriteSong({required int songId});
  Future<Either<Failure, List<int>>> getUserFavoriteSongs({required int userId});
  Future<Either<Failure, bool>> isSongFavorite({required int songId});
  Future<Either<Failure, void>> getPlaylist();
  Future<Either> getAllSongs();
}