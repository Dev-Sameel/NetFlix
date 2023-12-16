import 'package:flutter/material.dart';
import 'package:netflix/domain/apiendpoint.dart';
import 'package:netflix/infrastructure/api.dart';
import 'package:netflix/infrastructure/base_client.dart';
import 'package:netflix/model/movie_info.dart';
import 'package:netflix/presentation/widgets/title_with_content.dart';

import '../../../core/constans.dart';
import 'download_image_widget.dart';

class Indroducing extends StatefulWidget {
  const Indroducing({super.key});

  @override
  State<Indroducing> createState() => _IndroducingState();
}

class _IndroducingState extends State<Indroducing> {
  List imageList = [];

  @override
  void initState() {
    super.initState();
    initializeImages();
  }

  initializeImages() async {
    dynamic result = await apicall(ApiEndPoints.trendingall);
    result == null ? debugPrint("null") : debugPrint("not null");
    setState(() {
      imageList = result.results.map((MovieInfoModel movieInfo) {
        if (movieInfo.posterPath == null) {
          return null;
        }

        String imageUrl =
            'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apikey';
        return imageUrl;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const TitleWithContent(content: "We'll download a personalised selection of\nmovies and shows for you, so there's\nalways something to watch on your\ndevice.", title: "Introducing Downloads for you",colAlign: CrossAxisAlignment.center,txtAlign: TextAlign.center),
        kHeight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: imageList.length <3 ? []: [
              Center(
                  child: CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.5),
                radius: size.width * 0.4,
              )),
              DownloadsImageWidget(
                angle: 20,
                imageList: imageList[0],
                margin: const EdgeInsets.only(left: 130, bottom: 50, top: 20),
                size: Size(size.width * 0.4, size.width * 0.58),
              ),
              DownloadsImageWidget(
                  angle: -20,
                  imageList: imageList[1],
                  margin:
                      const EdgeInsets.only(right: 130, bottom: 50, top: 20),
                  size: Size(size.width * 0.4, size.width * 0.58)),
              DownloadsImageWidget(
                  imageList: imageList[2],
                  margin: const EdgeInsets.only(top: 10),
                  size: Size(size.width * 0.45, size.width * 0.65))
            ],
          ),
        ),
      ],
    );
  }
}
