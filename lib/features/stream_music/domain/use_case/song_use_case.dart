import 'dart:typed_data';
import 'package:streaming_music/features/stream_music/domain/repositories/i_song_repository.dart';

class SongUseCase {
  final SongRepository songRepository;
  SongUseCase(this.songRepository);

  Future<Uint8List> call (int songId){
    return songRepository.getSong(songId);
  }
  
}