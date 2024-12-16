import 'package:dartz/dartz.dart';
import '../../../../error/failure.dart';
import '../repositories/i_song_repository.dart';

class IsFavoriteSongUseCase {
  final SongRepository songRepository;

  IsFavoriteSongUseCase({required this.songRepository});

  Future<Either<Failure, bool>> call({required String songId}) =>
      songRepository.isSongFavorite(songId: songId);
}