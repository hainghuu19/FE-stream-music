import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:streaming_music/error/exception.dart';

class SongRemoteDataSource {
  final Dio dio;

  SongRemoteDataSource(this.dio);

  Future<Uint8List> getSong (int songId) async {
    final response = await dio.get(
      'http://10.0.2.2:8080/api/songs/play/$songId',
      options: Options(
        responseType: ResponseType.bytes
        ),
    );

    if(response.statusCode == 200){
      return Uint8List.fromList(response.data);
    } else {
      throw FetchDataException();
    }

  }

}