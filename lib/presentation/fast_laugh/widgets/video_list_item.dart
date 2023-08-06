import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constans.dart';
import 'package:netflix/infrastructure/api.dart';
import 'package:netflix/infrastructure/base_client.dart';
import 'package:netflix/model/movie_info.dart';
import 'package:netflix/presentation/fast_laugh/widgets/video_player.dart';
import 'package:netflix/presentation/widgets/icon_with_label.dart';

import '../../../domain/apiendpoint.dart';

final dummyVideoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4"
];


class VideoListItem extends StatefulWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  List imageList = [];
  trendingDataFetch() async {
    dynamic result = await apicall(ApiEndPoints.trendingall);
    setState(() {
      imageList = result.results.map((MovieInfoModel result) {
        String imageUrl =
            "https://image.tmdb.org/t/p/w500/${result.posterPath}?api_key=$apikey";
        return imageUrl;
      }).toList();
    });
  }

    @override
  void initState() {
    super.initState();
    trendingDataFetch();
  }

  @override
  Widget build(BuildContext context) {
     final videoUrl = dummyVideoUrls[widget.index % dummyVideoUrls.length];
    return Stack(
      children: [
       FastLaughVideoPlayer(videoUrl: videoUrl, onStateChanged: (boolean) {}),
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
               if (imageList.isNotEmpty) ...[
               Column(
                
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                 CircleAvatar(radius: 25,backgroundImage: NetworkImage(imageList[widget.index]),),
                 kHeight,
                 IconWithLabel(horizontal: 10,vertical: 10,icon: Icons.emoji_emotions, title: 'Lol'),
                 IconWithLabel(horizontal: 10,vertical: 10,icon: Icons.add, title: 'My List'),
                 IconWithLabel(horizontal: 10,vertical: 10,icon: Icons.share, title: 'Share'),
                 IconWithLabel(horizontal: 10,vertical: 10,icon: Icons.play_arrow, title: 'Play'),
                ],
              )
               ],
            ],
          ),
        )
      ],
    );
  }
}


