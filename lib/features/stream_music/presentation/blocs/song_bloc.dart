import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streaming_music/features/stream_music/presentation/blocs/song_event.dart';
import 'package:streaming_music/features/stream_music/presentation/blocs/song_state.dart';

import '../../domain/use_case/song_use_case.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  final SongUseCase songUseCase;

  SongBloc({required this.songUseCase}) : super(SongInitial()) {
    on<PlaySongEvent>(_onPlaySong);
    on<PauseSongEvent>(_onPauseSong);
    on<ResumeSongEvent>(_onResumeSong);
    on<StopSongEvent>(_onStopSong);
  }

  Future<void> _onPlaySong(PlaySongEvent event, Emitter<SongState> emit) async {
    emit(SongLoading());

    final result = await songUseCase(event.songId);

    result.fold((failure) => emit(SongError("Can't play this song")),
        (_) => emit(SongPlaying(event.songId)));
  }

  Future<void> _onPauseSong(
      PauseSongEvent event, Emitter<SongState> emit) async {
    if (state is SongPlaying) {
      final currentSongId = (state as SongPlaying).songId;
      emit(SongPaused(currentSongId));
    }
  }

  Future<void> _onResumeSong(
      ResumeSongEvent event, Emitter<SongState> emit) async {
    if (state is SongPaused) {
      final currentSongId = (state as SongPaused).songId;
      emit(SongPlaying(currentSongId));
    }
  }

  Future<void> _onStopSong(StopSongEvent event, Emitter<SongState> emit) async {
    emit(SongStopped());
  }
}
