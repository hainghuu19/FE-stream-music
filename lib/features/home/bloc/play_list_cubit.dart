import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../service_locator.dart';
import '../../stream_music/domain/use_case/get_all_song.dart';
import 'play_list_state.dart';

class PlayListCubit extends Cubit<PlayListState> {

  PlayListCubit() : super(PlayListLoading());

  Future < void > getPlayList() async {
    var returnedSongs = await getIt < GetAllSongsUseCase > ().call();
    returnedSongs.fold(
      (l) {
        emit(PlayListLoadFailure());
      },
      (data) {
        emit(
          PlayListLoaded(songs: data)
        );
      }
    );
  }
}