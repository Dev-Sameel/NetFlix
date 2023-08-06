import 'package:flutter/material.dart';
import 'package:netflix/core/constans.dart';
import 'package:netflix/infrastructure/api.dart';
import 'package:netflix/infrastructure/base_client.dart';
import 'package:netflix/model/movie_info.dart';
import 'package:netflix/presentation/search/widgets/search_result.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  final double height;
  final double width;
  final bool uniqueCard;
  final String title;
  final String url;
  const MainTitleCard(
      {super.key,
      required this.uniqueCard,
      required this.title,
      required this.url,
      this.height = 250,
      this.width = 150});

  @override
  Widget build(BuildContext context) {
    List imageList = [];

    return FutureBuilder(
        future: apicall(url),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            const Center(
              child: Column(children: [
                CircularProgressIndicator(
                  color: Colors.blue,
                ),
                Text('Please wait'),
              ]),
            );
          }
          if (snapshot.data == null) {
            return const Text('No data found');
          }
          if (snapshot.hasData) {
            imageList = snapshot.data.results.map((MovieInfoModel movieInfo) {
              if (movieInfo.posterPath == null) {
                return null;
              }

              String imageUrl =
                  'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apikey';
              return imageUrl;
            }).toList();
            if (imageList.isEmpty) {
              return ListTile(title: Text('No $title'));
            }
          }
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainTitle(title: title),
                kHeight,
                LimitedBox(
                    maxHeight: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                          10,
                          (index) => Padding(
                                padding: const EdgeInsets.only(right: 13),
                                child: MainCard(
                                    height: height,
                                    width: width,
                                    url: imageList[index],
                                    uniqueCard: uniqueCard,
                                    index: index + 1),
                              )),
                    ))
              ],
            ),
          );
        });
  }
}
