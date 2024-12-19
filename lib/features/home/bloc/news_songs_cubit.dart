import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streaming_music/features/stream_music/domain/use_case/get_all_song.dart';
import '../../../service_locator.dart';
import 'news_songs_state.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {

  NewsSongsCubit() : super(NewsSongsLoading());

  Future < void > getAllSongs() async {
    emit(NewsSongsLoading());
    final result = await getIt<GetAllSongsUseCase>().call();
    result.fold(
      (l) {
        emit(NewsSongsLoadFailure());
      },
      (songData) {
        emit(
          NewsSongsLoaded(songs: songData)
        );
      }
    );
  }
  
  
}