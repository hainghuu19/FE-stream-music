
abstract class SongEvent {}

class PlaySongEvent extends SongEvent{
  final int songId;
  PlaySongEvent(this.songId);
  
  List<Object?> get props => [songId];
}

class PauseSongEvent extends SongEvent {
  final int songId;

  PauseSongEvent(this.songId);

  @override
  List<Object?> get props => [songId];

}

class ResumeSongEvent extends SongEvent{
  final int songId;

  ResumeSongEvent(this.songId);

  @override
  List<Object?> get props => [songId];
  
}

class StopSongEvent extends SongEvent{

}

class UpdateSongPositionEvent extends SongEvent {
  final int songId;
  final Duration songPosition;
  final Duration songDuration;

  UpdateSongPositionEvent({
    required this.songId,
    required this.songPosition,
    required this.songDuration,
  });

  List<Object?> get props => [songId, songPosition, songDuration];
}
