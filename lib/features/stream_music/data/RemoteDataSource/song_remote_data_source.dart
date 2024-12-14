import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:streaming_music/error/exception.dart';

class SongRemoteDataSource {
  final Dio dio;
  final _audioPlayer = AudioPlayer();

  SongRemoteDataSource(this.dio);

  Future<void> getSong (int songId) async {
    final response = await dio.get(
      'http://10.0.2.2:8080/api/songs/play/$songId',
      options: Options(
        responseType: ResponseType.bytes
        ),
    );

    if(response.statusCode == 200){
      Uint8List bytes = Uint8List.fromList(response.data);
      await _audioPlayer.play(BytesSource(bytes));
    } else {
      throw FetchDataException();
    }

  }

}