import 'package:flutter/material.dart';
import 'package:netflix/core/constans.dart';
import 'package:netflix/infrastructure/api.dart';
import 'package:netflix/model/movie_info.dart';
import 'package:netflix/presentation/new_and_hot/widgets/image_with_soundicon.dart';
import 'package:netflix/presentation/widgets/icon_with_label.dart';
import 'package:netflix/presentation/widgets/title_with_content.dart';

class EveryonesWatching extends StatelessWidget {
  final MovieInfoModel movieInfo;
  const EveryonesWatching({super.key,required this.movieInfo});

  @override
  Widget build(BuildContext context) {
     String imageUrl =
        'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apikey';
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          TitleWithContent(
            content:
                movieInfo.overview,
            title: movieInfo.originalTitle ?? 'No Title Found',
          ),
          kHeight50,
          ImageWithSoundIcon(
              videoImage: imageUrl),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconWithLabel(
                  
                  textSize:14,
                  icon: Icons.near_me,
                  title: 'Share',
                  vertical: 10,
                  horizontal: 8),
              IconWithLabel(
                  
                  textSize:14,
                  icon: Icons.add,
                  title: 'My List',
                  vertical: 10,
                  horizontal: 8),
              IconWithLabel(
                  iconSize:30,
                  textSize:14,
                  icon: Icons.play_arrow,
                  title: 'Play',
                  vertical: 10,
                  horizontal: 8)
            ],
          )
        ],
      ),
    );
  }
}
