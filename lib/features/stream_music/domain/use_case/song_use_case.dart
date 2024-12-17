import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:streaming_music/features/stream_music/domain/repositories/i_song_repository.dart';

import '../../../../error/failure.dart';

class SongUseCase {
  SongRepository songRepository;
  SongUseCase(this.songRepository);

  Future<Either<Failure, Uint8List>> call(int songId) async {
    try {
      final result = await songRepository.getSong(songId);
      return result;
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
  