import 'package:dartz/dartz.dart';
import 'package:streaming_music/error/failure.dart';

abstract class SongRepository{
  Future<Either<Failure, void>> playSong(int songId);
}