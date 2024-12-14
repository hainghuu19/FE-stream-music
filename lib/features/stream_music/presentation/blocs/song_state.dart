abstract class SongState {}

class SongInitial extends SongState {}

class SongLoading extends SongState {}

class SongPlaying extends SongState {
  final int songId;
  SongPlaying(this.songId);
}

class SongPaused extends SongState {
  final int songId;
  SongPaused(this.songId);
}

class SongStopped extends SongState {}

class SongError extends SongState {
  final String message;
  SongError(this.message);
}
