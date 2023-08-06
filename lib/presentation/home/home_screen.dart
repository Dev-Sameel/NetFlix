import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/constans.dart';
import 'package:netflix/domain/apiendpoint.dart';
import 'package:netflix/presentation/home/home_main_poster.dart';
import 'package:netflix/presentation/home/home_scroll_direction.dart';
import 'package:netflix/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (BuildContext context, bool value, _) {
        return Padding(
          padding: const EdgeInsets.only(left: 10),
          child: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true; //false koduthaal display aakilla
            },
            child: Stack(
              children: [
                ListView(
                  children:  const [
                    HomeMainPoster(),
                    MainTitleCard(
                        uniqueCard: false,
                        title: 'New Releases',
                        url:
                            ApiEndPoints.moviepopular),
                    MainTitleCard(
                        uniqueCard: false,
                        title: 'Trending Now',
                        url:
                            ApiEndPoints.trendingall),
                    MainTitleCard(
                      uniqueCard: true,
                      title: 'Top 10 TV Shows in India Today',
                      url:
                          ApiEndPoints.tvpopular,
                      height: 250,
                      width: 150,
                    ),
                    MainTitleCard(
                        uniqueCard: false,
                        title: 'Tense Dramas',
                        url:
                            ApiEndPoints.toprate),
                    MainTitleCard(
                        uniqueCard: false,
                        title: 'Discover',
                        url:
                            ApiEndPoints.tvtoprate),
                  ],
                ),
                scrollNotifier.value == true ? HomeScrollDirection() : kHeight
              ],
            ),
          ),
        );
      },
    ));
  }
}
