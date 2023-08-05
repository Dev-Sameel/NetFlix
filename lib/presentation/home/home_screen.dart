import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/constans.dart';
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
                  children: const [
                    HomeMainPoster(),
                    MainTitleCard(
                        uniqueCard: false,
                        title: 'Released in the Past Year',
                        url:
                            'https://m.media-amazon.com/images/M/MV5BYWE3MDVkN2EtNjQ5MS00ZDQ4LTliNzYtMjc2YWMzMDEwMTA3XkEyXkFqcGdeQXVyMTEzMTI1Mjk3._V1_FMjpg_UX1000_.jpg'),
                    MainTitleCard(
                        uniqueCard: false,
                        title: 'Trending Now',
                        url:
                            'https://i.pinimg.com/474x/a4/23/0f/a4230f6c4e62f8a5928d7e48dfc0c823.jpg'),
                    MainTitleCard(
                      uniqueCard: true,
                      title: 'Top 10 TV Shows in India Today',
                      url:
                          'https://m.media-amazon.com/images/I/41Mz8jDRq2L._AC_UF1000,1000_QL80_.jpg',
                      height: 250,
                      width: 150,
                    ),
                    MainTitleCard(
                        uniqueCard: false,
                        title: 'Tense Dramas',
                        url:
                            'https://www.tallengestore.com/cdn/shop/products/Narcos-PabloEscobar-NetflixTVShowPosterFanArt_95ec6547-33b2-4e5c-b3a9-a43eaa59cc3c.jpg?v=1589271816'),
                    MainTitleCard(
                        uniqueCard: false,
                        title: 'South Indian Cinema',
                        url:
                            'https://www.scrolldroll.com/wp-content/uploads/2022/10/jana-gana-mana-south-indian-movies-of-2022-on-netflix.jpg'),
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
