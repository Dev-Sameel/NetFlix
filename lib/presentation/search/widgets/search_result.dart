import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constans.dart';
import 'package:netflix/infrastructure/api.dart';
import 'package:netflix/infrastructure/base_client.dart';
import 'package:netflix/model/movie_info.dart';
import 'package:netflix/presentation/search/widgets/title.dart';

import '../../../domain/apiendpoint.dart';

String imageUrl =
    "https://media.istockphoto.com/id/1051788618/vector/movie-and-film-poster-template-design-modern-retro-vintage-style.jpg?s=612x612&w=0&k=20&c=CwMag6f5GwoHexEtMA5zrep78r4Q4yV0ZF8X0CUCIUs=";

class SearchResultWidget extends StatelessWidget {
  final String apiQuery;
  const SearchResultWidget({super.key, required this.apiQuery});

  @override
  Widget build(BuildContext context) {
    List imageList = [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & TV'),
        kHeight,
        Expanded(
            child: FutureBuilder(
                future: apicall(ApiEndPoints.searchmovie + apiQuery),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                          Text('Please wait'),
                        ],
                      ),
                    );
                  }

                  if (snapshot.data == null) {
                    return const Center(
                        child: Text(
                      'No data found',
                      style: TextStyle(fontSize: 20),
                    ));
                  }
                  imageList =
                      snapshot.data.results.map((MovieInfoModel movieInfo) {
                    if (movieInfo.posterPath != null) {
                      imageUrl =
                          'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apikey';
                    }
                    return imageUrl;
                  }).toList();

                  if (imageList.isEmpty) {
                    return const Center(
                        child: Text(
                      'No Movies Found',
                      style: TextStyle(fontSize: 20),
                    ));
                  }

                  return GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 1 / 1.5, //first-width second-height
                      children: List.generate(imageList.length, (index) {
                        return  MainCard(
                          url:
                              imageList[index],
                          uniqueCard: false,
                        );
                      }));
                }))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final int? index;
  final bool uniqueCard;
  final double width;
  final double height;
  final String url;
  const MainCard(
      {super.key,
      this.index,
      this.height = 0,
      this.width = 0,
      required this.url,
      required this.uniqueCard});

  @override
  Widget build(BuildContext context) {
    return uniqueCard == true
        ? Stack(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 40,
                    height: 150,
                  ),
                  Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(7),
                        image: DecorationImage(
                            image: NetworkImage(url), fit: BoxFit.cover)),
                  ),
                ],
              ),
              Positioned(
                  top: 95,
                  child: BorderedText(
                      strokeWidth: 5.0,
                      strokeColor: kWhite,
                      child: Text(
                        '$index',
                        style: const TextStyle(
                            fontSize: 100,
                            color: kBlack,
                            fontWeight: FontWeight.bold),
                      ))),
            ],
          )
        : Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(7),
                image: DecorationImage(
                    image: NetworkImage(url), fit: BoxFit.cover)),
          );
  }
}
