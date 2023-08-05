import 'package:flutter/material.dart';
import 'package:netflix/core/constans.dart';
import 'package:netflix/presentation/new_and_hot/widgets/image_with_soundicon.dart';
import 'package:netflix/presentation/widgets/icon_with_label.dart';
import 'package:netflix/presentation/widgets/title_with_content.dart';

class EveryonesWatching extends StatelessWidget {
  const EveryonesWatching({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        children: [
          TitleWithContent(
            content:
                'Three friends, who are extremely close, face many complications after several people plot to break them apart due to various reasons by spreading lies and creating misunderstandings amongst them.',
            title: 'Friends',
          ),
          kHeight50,
          ImageWithSoundIcon(
              image: 'https://wallpapercave.com/wp/wp4329171.jpg'),
          Row(
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
