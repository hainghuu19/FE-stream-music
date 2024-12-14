import 'package:dartz/dartz.dart';
import 'package:streaming_music/error/failure.dart';
import 'package:streaming_music/features/stream_music/domain/repositories/i_song_repository.dart';

class SongUseCase {
  final SongRepository songRepository;
  SongUseCase(this.songRepository);

  Future<Either<Failure, void>> call (int songId){
    return songRepository.playSong(songId);
  }
  
}