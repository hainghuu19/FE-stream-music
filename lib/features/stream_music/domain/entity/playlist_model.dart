
import 'package:streaming_music/features/stream_music/domain/entity/playlist_entity.dart';

class PlayListModel extends PlayListEntity{
  PlayListModel({
    required songId, 
    required title, 
    required artistName, 
    required albumTitle, 
    String? genre, 
    int? duration, 
    String? audioFilePath, 
    int? playCount, 
    String? releaseDate
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
    );

  factory PlayListModel.fromJson(Map<String, dynamic> json) {
    return PlayListModel(
      songId: json['songId'] as int,
      title: json['title'] as String,
      audioFilePath: json['audioFilePath'] as String,
      artistName: json['artistName'] as String,
      albumTitle: json['albumTitle'] as String? ?? 'Unknow Title',
      genre: json['genre'] as String? ?? 'Unknow Title',
      duration: json['duration'] as int?,
      releaseDate: json['releaseDate'] as String?,
      playCount: json['playCount'] as int? ?? 0,
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
    };
  }

}