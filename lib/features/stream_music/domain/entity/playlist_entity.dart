class PlayListEntity {
  final int songId;
  final String title;
  final int? artistId;
  final String? albumTitle;
  final String? genre;
  final int? duration;
  final String? releaseDate;
  final int? playCount;
  final String? audioFilePath;
  final bool? isFavorite;
  final String? artistName;
  final int? likeCount;

  PlayListEntity({
      required this.songId,
      required this.title,
      this.audioFilePath,
      this.artistId,
      this.albumTitle,
      this.genre,
      this.duration,
      this.releaseDate,
      this.playCount,
      this.isFavorite,
      this.artistName,
      this.likeCount});
}
