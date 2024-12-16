import 'package:dartz/dartz.dart';

import '../../../../error/failure.dart';
import '../repositories/i_song_repository.dart';

class GetPlaylist{
  final SongRepository songRepository;
  GetPlaylist({required this.songRepository});

  Future<Either<Failure, void>> call() => songRepository.getPlaylist();
  
}