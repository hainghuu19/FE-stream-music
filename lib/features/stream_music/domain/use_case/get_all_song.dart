import 'package:dartz/dartz.dart';
import '../repositories/i_song_repository.dart';

class GetAllSongsUseCase {
  final SongRepository songRepository;
  GetAllSongsUseCase(this.songRepository);

  Future<Either> call() => songRepository.getAllSongs();
}