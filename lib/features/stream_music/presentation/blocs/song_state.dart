abstract class SongState {}

class SongInitial extends SongState {}

class SongLoading extends SongState {}

class SongPlaying extends SongState {
  final int songId;
  final Duration songPosition;
  final Duration songDuration;

  SongPlaying({required this.songId, required this.songPosition, required this.songDuration});

  List<Object?> get props => [songId, songPosition, songDuration];
}

class SongPaused extends SongState {
  final int songId;

  SongPaused(this.songId);
  
  @override
  List<Object?> get props => [songId];
}

class SongStopped extends SongState {}

class SongError extends SongState {
  final String message;
  SongError(this.message);
}
