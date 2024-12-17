import 'package:dartz/dartz.dart';
import '../repositories/i_song_repository.dart';

class GetPlaylistUseCase{
  final SongRepository songRepository;
  GetPlaylistUseCase(this.songRepository);

  Future<Either> call() => songRepository.getPlaylist();
  
}