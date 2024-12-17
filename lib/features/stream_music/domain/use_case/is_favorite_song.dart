import 'package:dartz/dartz.dart';
import '../../../../error/failure.dart';
import '../repositories/i_song_repository.dart';

class IsFavoriteSongUseCase {
  final SongRepository songRepository;

  IsFavoriteSongUseCase(this.songRepository);

  Future<Either<Failure, bool>> call({required int songId}) =>
      songRepository.isSongFavorite(songId: songId);
}