
abstract class SongEvent {}

class PlaySongEvent extends SongEvent{
  final int songId;
  PlaySongEvent(this.songId);
}

class PauseSongEvent extends SongEvent {

}

class ResumeSongEvent extends SongEvent{
  
}

class StopSongEvent extends SongEvent{

}