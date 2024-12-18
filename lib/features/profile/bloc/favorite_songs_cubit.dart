import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../service_locator.dart';
import '../../stream_music/domain/entity/song_entity.dart';
import '../../stream_music/domain/repositories/i_song_repository.dart';
import '../../stream_music/domain/use_case/get_favorite_song.dart';
import 'favorite_songs_state.dart';

class FavoriteSongsCubit extends Cubit<FavoriteSongsState> {
  final GetUserFavoriteSongsUseCase getUserFavoriteSongsUseCase;
  final SongRepository songRepository;

FavoriteSongsCubit({
    required this.getUserFavoriteSongsUseCase,
    required this.songRepository,
  }) : super(FavoriteSongsLoading());
  
  
  List<Song> favoriteSongs = [];

  Future<void> getFavoriteSongs({required int userId}) async {
    final result = await getIt<GetUserFavoriteSongsUseCase>().call(userId: userId);
    result.fold((l) {
      emit(FavoriteSongsFailure());
    }, (r) async {
      favoriteSongs = await mapSongIdsToSongs(r);
      emit(FavoriteSongsLoaded(favoriteSongs: favoriteSongs));
    });


    
  }

  Future<List<Song>> mapSongIdsToSongs(List<int> songIds) async {
    // Thay thế bằng logic thực tế để ánh xạ songId -> Song
    return songIds.map((id) => Song(songId: id, title: 'Song $id', audioPath: '', isFavorite: true, artist: '')).toList();
  }

  // Trong trường hợp không hiển thị danh sách bài hát yêu thích của người dùng như mong muốn -> phải có thêm getSOngDetail trong songRepository
  // Future<List<Song>> _mapSongIdsToSongs(List<int> songIds) async {
  //   List<Song> songs = [];
  //   for (int songId in songIds) {
  //     final result = await songRepository.getSongDetail(songId: songId);
  //     result.fold(
  //       (failure) {
  //         // Xử lý lỗi nếu không lấy được chi tiết bài hát
  //       },
  //       (song) {
  //         songs.add(song);
  //       },
  //     );
  //   }
  //   return songs;
  // }



 void removeSong(int index) {
   favoriteSongs.removeAt(index);
   emit(
     FavoriteSongsLoaded(favoriteSongs: favoriteSongs)
   );
 }

}