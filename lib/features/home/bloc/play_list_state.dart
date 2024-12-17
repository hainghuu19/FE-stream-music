import '../../stream_music/domain/entity/song_entity.dart';

abstract class PlayListState {}

class PlayListLoading extends PlayListState {}

class PlayListLoaded extends PlayListState {
  final List<Song> songs;
  PlayListLoaded({required this.songs});
}

class PlayListLoadFailure extends PlayListState {}