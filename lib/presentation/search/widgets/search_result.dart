import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constans.dart';
import 'package:netflix/infrastructure/api.dart';
import 'package:netflix/infrastructure/base_client.dart';

import 'package:netflix/presentation/search/widgets/title.dart';

import '../../../domain/apiendpoint.dart';

String imageUrl =
    "https://media.istockphoto.com/id/1051788618/vector/movie-and-film-poster-template-design-modern-retro-vintage-style.jpg?s=612x612&w=0&k=20&c=CwMag6f5GwoHexEtMA5zrep78r4Q4yV0ZF8X0CUCIUs=";
// 'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apikey'
class SearchResultWidget extends StatelessWidget {
  final String apiQuery;
  const SearchResultWidget({super.key, required this.apiQuery});

  @override
  Widget build(BuildContext context) {
  
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & TV'),
        kHeight,
        Expanded(
            child: FutureBuilder(
                future: apicall(ApiEndPoints.searchmovie + apiQuery),
                builder: (context, snapshot) {
               if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('Error: NetWork Issue'));
                    } else if (!snapshot.hasData) {
                      return const Center(child: Text('No data available'));
                    } else {
                      final weather = snapshot.data!;
                      return GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 1 / 1.5, //first-width second-height
                      children: List.generate(weather.results.length, (index) {
                        return  MainCard(
                          index: index,
                          url:
                              ApiEndPoints.searchmovie + apiQuery,
                          uniqueCard: false,
                        );
                      }));
                }}))
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
                  FutureBuilder(
                    future: apicall(url),
                    builder: (context, snapshot) { 
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('Error: NetWork Issue'));
                    } else if (!snapshot.hasData) {
                      return const Center(child: Text('No data available'));
                    } else {
                      final weather = snapshot.data!;
                      return Container(
                      width: width,
                      height: height,
                      decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(7),
                          image: DecorationImage(
                          image: NetworkImage('https://image.tmdb.org/t/p/w500${weather.results[index].posterPath}?api_key=$apikey'), fit: BoxFit.cover)),
                    );
                    }
  }),
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
        :  FutureBuilder(
                    future: apicall(url),
                    builder: (context, snapshot) { 
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('Error: NetWork Issue'));
                    } else if (!snapshot.hasData) {
                      return const Center(child: Text('No data available'));
                    } else {
                      final weather = snapshot.data!;
                      return Container(
                      width: width,
                      height: height,
                      decoration: BoxDecoration(
                          color: kBlack,
                          borderRadius: BorderRadius.circular(7),
                          image: DecorationImage(
                          image: NetworkImage('https://image.tmdb.org/t/p/w500${weather.results[index].posterPath}?api_key=$apikey'), fit: BoxFit.cover)),
                    );
                    }
  });
  }
}
