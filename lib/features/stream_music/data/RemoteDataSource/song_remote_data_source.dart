import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:streaming_music/error/exception.dart';
import 'package:streaming_music/features/stream_music/domain/entity/song_entity.dart';

import '../../domain/entity/song_model.dart';

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

  Future<List<SongModel>> getAllSongs() async {
    try {
      final response =
          await dio.get('http://10.0.2.2:8080/api/songs/get-all-songs');

      if (response.statusCode == 200) {
        final data = response.data as List;
        return data.map((song) => SongModel.fromJson(song)).toList();
      } 
      else {
        throw ServerException();
      }
    } catch (e) {
      rethrow;
    }
  }

  // Future<List<SongModel>> getPlaylist() async {
  //   try {
  //     final response =
  //         await dio.get('http://
  //         10.0.2.2:8080/api/songs/get-playlist');

  //   } catch (e) {
  //     print('DEBUG: Exception in getPlaylist: $e');
  //     rethrow;
  //   }
  // }





}