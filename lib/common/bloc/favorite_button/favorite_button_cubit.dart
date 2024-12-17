import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streaming_music/common/bloc/favorite_button/favorite_button_state.dart';
import 'package:streaming_music/service_locator.dart';

import '../../../features/stream_music/domain/use_case/add_or_remove_favorite_song.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {

  FavoriteButtonCubit() : super(FavoriteButtonInitial());

  Future<void> favoriteButtonUpdated(int songId) async {
    
    var result = await getIt<AddOrRemoveFavoriteSongUseCase>().call(
        songId: songId
    );
    result.fold(
      (l){},
      (isFavorite){
        emit(
          FavoriteButtonUpdated(
            isFavorite: isFavorite
          )
        );
      },
    );
  }
}