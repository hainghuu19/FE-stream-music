// import 'package:just_audio/just_audio.dart';
import 'package:just_audio/just_audio.dart';
import 'package:streaming_music/features/stream_music/data/RemoteDataSource/song_remote_data_source.dart';

class AudioService{
  final SongRemoteDataSource songRemoteDataSource;
  final AudioPlayer audioPlayer;

  AudioService({required this.songRemoteDataSource, required this.audioPlayer});
  Future<void> playSong(int songId) async {
    try{
      final songBytes = await songRemoteDataSource.getSong(songId);
      final uri = Uri.dataFromBytes(songBytes);
      await audioPlayer.setUrl(uri.toString());
      await audioPlayer.play();
    } catch(e){
      throw Exception('Error playing song: $e');
    }
  }

  Future<void> pauseSong() async {
    await audioPlayer.pause();
  }

  Future<void> resumeSong() async {
    await audioPlayer.play();
  }

  Future<void> stopSong() async {
    await audioPlayer.stop();
  }

  Stream<Duration> get positionStream => audioPlayer.positionStream;
  Stream<Duration?> get durationStream => audioPlayer.durationStream;

  



}