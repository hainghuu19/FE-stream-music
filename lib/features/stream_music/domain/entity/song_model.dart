import 'package:streaming_music/features/stream_music/domain/entity/song_entity.dart';

class SongModel extends Song {
   SongModel({
    required int songId,
    required String title,
    required String artistName, 
    required String albumTitle, 
    String? genre,
    int? duration,
    String? audioFilePath,
    int? playCount,
    String? releaseDate,
    int? likeCount,
  }) : super(
          songId: songId,
          title: title,
          artistName: artistName,
          albumTitle: albumTitle,
          genre: genre,
          duration: duration,
          audioFilePath: audioFilePath,
          playCount: playCount,
          releaseDate: releaseDate,
          likeCount: likeCount,
        );

  // Từ JSON sang `SongModel`
  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      songId: json['songId'] as int,
      title: json['title'] as String,
      audioFilePath: json['audioFilePath'] as String,
      artistName: json['artistName'] as String,
      albumTitle: json['albumTitle'] as String? ?? 'Unknow Title',
      genre: json['genre'] as String? ?? 'Unknow Title',
      duration: json['duration'] as int?,
      releaseDate: json['releaseDate'] as String?,
      playCount: json['playCount'] as int? ?? 0,
      likeCount: json['likeCount'] as int? ?? 0,
    );
  }

  // Từ `SongModel` sang JSON
  Map<String, dynamic> toJson() {
    return {
      'songId': songId,
      'title': title,
      'audioFilePath': audioFilePath,
      'artistName': artistName,
      'albumTitle': albumTitle,
      'genre': genre,
      'duration': duration,
      'releaseDate': releaseDate,
      'playCount': playCount,
      'likeCount': likeCount,
    };
  }
}
