

class Song {
  final int songId;
  final String title;
  final int? artistId;
  final int? albumId;
  final String? genre;
  final int? duration;
  final String? releaseDate;
  final int? playCount;
  final String audioPath;
  // them song favorite
  final bool isFavorite;
  final String artist;

  Song({
    required this.songId,
    required this.title,
    required this.audioPath,
    this.artistId,
    this.albumId,
    this.genre,
    this.duration,
    this.releaseDate,
    this.playCount,
    required this.isFavorite,
    required this.artist
    });

}