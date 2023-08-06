import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constans.dart';
import 'package:netflix/domain/apiendpoint.dart';
import 'package:netflix/infrastructure/api.dart';
import 'package:netflix/infrastructure/base_client.dart';
import 'package:netflix/model/movie_info.dart';
import 'package:netflix/presentation/widgets/icon_with_label.dart';

class HomeMainPoster extends StatefulWidget {
  // final IconData icon;
  // final String title;
  const HomeMainPoster({
    super.key,
    // required this.icon,
    // required this.title,
  });

  @override
  State<HomeMainPoster> createState() => _HomeMainPosterState();
}

class _HomeMainPosterState extends State<HomeMainPoster> {

  @override
  initState() {
    super.initState();
    setImage();
  }

  setImage() async {
    dynamic result = await apicall(ApiEndPoints.moviepopular);

    setState(() {
      if (result.results.isNotEmpty) {
        MovieInfoModel movieInfo = result.results[0];
        imageUrl =
            "https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apikey";
      }
    });
  }
  String? imageUrl;
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration:  BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageUrl ?? kMainImage),
                  fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const IconWithLabel(icon: Icons.add, title: 'MyList', vertical:10, horizontal: 0),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_arrow,
                    size: 30,
                  ),
                  label: const Text('Play', style: kWeight),
                  style: const ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(kBlack),
                      backgroundColor: MaterialStatePropertyAll(kWhite)),
                ),
               const IconWithLabel(icon: Icons.info_outline, title: 'Info', vertical: 0, horizontal: 0)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

