import 'package:dartz/dartz.dart';

import '../../../../error/failure.dart';
import '../repositories/i_song_repository.dart';

class AddOrRemoveFavoriteSongUseCase {
  final SongRepository songRepository;

  AddOrRemoveFavoriteSongUseCase({required this.songRepository});

  Future<Either<Failure, bool>> call({required String songId}) => songRepository.addOrRemoveFavoriteSong(songId: songId);
  
}