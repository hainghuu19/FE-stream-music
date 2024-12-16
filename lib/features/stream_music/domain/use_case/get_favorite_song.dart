import 'package:dartz/dartz.dart';
import 'package:streaming_music/features/stream_music/domain/repositories/i_song_repository.dart';
import '../../../../error/failure.dart';


class GetUserFavoriteSongsUseCase {
  final SongRepository songRepository;

  GetUserFavoriteSongsUseCase({required this.songRepository});

  Future<Either<Failure, List<int>>> call(int songId) => songRepository.getUserFavoriteSongs(songId: songId);

}