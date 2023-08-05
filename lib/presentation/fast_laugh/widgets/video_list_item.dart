import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constans.dart';
import 'package:netflix/presentation/widgets/icon_with_label.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //left side
              Align(
                alignment: Alignment.bottomLeft,
                child: CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                    radius: 30,
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.volume_off,color: kWhite,))),
              ),

              //right side
              const Column(
                
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                 CircleAvatar(radius: 25,backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/2048px-Circle-icons-profile.svg.png'),),
                 kHeight,
                 IconWithLabel(horizontal: 10,vertical: 10,icon: Icons.emoji_emotions, title: 'Lol'),
                 IconWithLabel(horizontal: 10,vertical: 10,icon: Icons.add, title: 'My List'),
                 IconWithLabel(horizontal: 10,vertical: 10,icon: Icons.share, title: 'Share'),
                 IconWithLabel(horizontal: 10,vertical: 10,icon: Icons.play_arrow, title: 'Play'),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}


