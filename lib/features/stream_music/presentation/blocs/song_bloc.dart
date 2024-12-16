import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streaming_music/features/stream_music/domain/repositories/i_song_repository.dart';
import 'package:streaming_music/features/stream_music/presentation/blocs/song_event.dart';
import 'package:streaming_music/features/stream_music/presentation/blocs/song_state.dart';
import '../../../../service/song_service.dart';


class SongBloc extends Bloc<SongEvent, SongState> {
  final SongRepository songRepository;
  final AudioService audioService;

  SongBloc(this.audioService, {required this.songRepository}) : super(SongInitial()) {
    on<PlaySongEvent>(_onPlaySong);
    on<PauseSongEvent>(_onPauseSong);
    on<ResumeSongEvent>(_onResumeSong);
    on<StopSongEvent>(_onStopSong);

    audioService.positionStream.listen((position) {
      if (state is SongPlaying) {
        final currentState = state as SongPlaying;
        add(UpdateSongPositionEvent(
          songId: currentState.songId,
          songPosition: position,
          songDuration: currentState.songDuration,
        ));
      }
    });

    // Listen to duration updates
    audioService.durationStream.listen((duration) {
      if (state is SongPlaying && duration != null) {
        final currentState = state as SongPlaying;
        add(UpdateSongPositionEvent(
          songId: currentState.songId,
          songPosition: currentState.songPosition,
          songDuration: duration,
        ));
      }
    });

  }

  Future<void> _onPlaySong(PlaySongEvent event, Emitter<SongState> emit) async {
    try {
      emit(SongLoading());

      await audioService.playSong(event.songId);
      emit(SongPlaying(
        songId: event.songId,
        songPosition: Duration.zero,
        songDuration: Duration.zero,
      ));
    } catch (e) {
      emit(SongError('Failed to play song: $e'));
    }
  }

 Future<void> _onPauseSong(
      PauseSongEvent event, Emitter<SongState> emit) async {
    try {
      await audioService.pauseSong();
      emit(SongPaused(event.songId));
    } catch (e) {
      emit(SongError('Failed to pause song: $e'));
    }
  }

  Future<void> _onResumeSong(
      ResumeSongEvent event, Emitter<SongState> emit) async {
    try {
      await audioService.resumeSong();
      if (state is SongPaused) {
        final currentState = state as SongPaused;
        emit(SongPlaying(
          songId: currentState.songId,
          songPosition: Duration.zero,
          songDuration: Duration.zero,
        ));
      }
    } catch (e) {
      emit(SongError('Failed to resume song: $e'));
    }
  }

 Future<void> _onStopSong(StopSongEvent event, Emitter<SongState> emit) async {
    try {
      await audioService.stopSong();
      emit(SongStopped());
    } catch (e) {
      emit(SongError('Failed to stop song: $e'));
    }
  }


}
