import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streaming_music/features/stream_music/domain/repositories/i_song_repository.dart';
import 'package:streaming_music/features/stream_music/presentation/blocs/song_bloc.dart';
import 'package:streaming_music/features/stream_music/presentation/blocs/song_event.dart';
import 'package:streaming_music/service_locator.dart';
import '../../../common/widgets/appbar/app_bar.dart';
import '../../../common/widgets/favorite_button/favorite_button.dart';
import '../../../core/configs/constants/app_urls.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../service/song_service.dart';
import '../domain/entity/song_entity.dart';
import 'blocs/song_state.dart';

class SongPlayerPage extends StatelessWidget {
  final Song songEntity;
  const SongPlayerPage({required this.songEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: const Text(
          'Now playing',
          style: TextStyle(fontSize: 18),
        ),
        action: IconButton(
            onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
      ),
      body: BlocProvider(
        create: (_) => SongBloc(songRepository: getIt<SongRepository>(), getIt<AudioService>())..add(PlaySongEvent(songEntity.songId)),
          // ..loadSong(
          //     '${AppURLs.songFirestorage}${songEntity.artist} - ${songEntity.title}.mp3?${AppURLs.mediaAlt}'),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Builder(builder: (context) {
            return Column(
              children: [
                _songCover(context),
                const SizedBox(
                  height: 20,
                ),
                _songDetail(),
                const SizedBox(
                  height: 30,
                ),
                _songPlayer(context)
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _songCover(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  '${AppURLs.coverFirestorage}${songEntity.artistId} - ${songEntity.title}.jpg?${AppURLs.mediaAlt}'))),
    );
  }

  Widget _songDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              songEntity.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'songEntity.artist',  // sua tam thanh text
              style:  TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),
          ],
        ),
        FavoriteButton(songEntity: songEntity)
      ],
    );
  }

  Widget _songPlayer(BuildContext context) {
    return BlocBuilder<SongBloc, SongState>(
      builder: (context, state) {
        if (state is SongLoading) {
          return const CircularProgressIndicator();
        }
        if (state is SongLoading) {
          return const CircularProgressIndicator();
        }
        if(state is SongPlaying || state is SongPaused) {
          final songId = state is SongPlaying ? state.songId : (state as SongPaused).songId;
          final songPosition = state is SongPlaying ? state.songPosition : Duration.zero ;
          final songDuration = state is SongPlaying ? state.songDuration : Duration.zero ;
        
          return Column(
            children: [
              Slider(
                  value: songPosition.inSeconds.toDouble(),
                  min: 0.0,
                  max: songDuration.inSeconds.toDouble(),
                  onChanged: (value) {}
                  ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatDuration(songPosition)),
                  Text(formatDuration(songDuration))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  if(state is SongPlaying) {
                    context.read<SongBloc>().add(PauseSongEvent(songId));
                  } else if(state is SongPaused) {
                    context.read<SongBloc>().add(ResumeSongEvent(songId));
                  }
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.primary),
                  child: Icon(
                    state is SongPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                      ),
                ),
              )
            ],
          );
        }

        if (state is SongError) {
          return Text('Error: ${state.message}', 
          style: const TextStyle(color: Colors.red),
          );
        }

        return const SizedBox.shrink(); // khong hien thi gi neu khong co suitable state
      },
    );
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
