import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streaming_music/common/helpers/is_dark_mode.dart';
import '../../../core/configs/constants/app_urls.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../stream_music/domain/entity/song_entity.dart';
import '../../stream_music/presentation/song_player.dart';
import '../bloc/news_songs_cubit.dart';
import '../bloc/news_songs_state.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getAllSongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewsSongsCubit,NewsSongsState>(
          builder: (context,state) {
            if (state is NewsSongsLoading) {
              return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator()
              );
            } 

            if (state is NewsSongsLoaded) {
              return _songs(
                state.songs
              );
            }
            return Container();

          },
        )
        
      ),
    );
  }

  Widget _songs(List<Song> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context,index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
               builder: (BuildContext context) 
              => SongPlayerPage(
                songEntity: songs[index],
              )
            )
            );
          },
          child: SizedBox(
            width: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          '${AppURLs.coverFirestorage}${songs[index].songId} - ${songs[index].title}.jpg?${AppURLs.mediaAlt}'
                        )
                      )
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 40,
                        width: 40,
                        transform: Matrix4.translationValues(10, 10, 0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.isDarkMode ?  AppColors.darkGrey : const Color(0xffE6E6E6)
                        ),
                        child: Icon(
                          Icons.play_arrow_rounded,
                          color: context.isDarkMode ? const Color(0xff959595) : const Color(0xff555555),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  songs[index].title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16
                  ),
                ) ,
                const SizedBox(height: 5,),
                const Text(
                  'songs[index].artist', // sua tam thanh text
                  style:  TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12
                  ),
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context,index) => const SizedBox(width: 14,),
      itemCount: songs.length
    );
  }
}