import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constans.dart';
import 'package:netflix/presentation/search/widgets/title.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & TV'),
        kHeight,
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1 / 1.5, //first-width second-height
            children: List.generate(20, (index) {
              return const MainCard(
                url:
                    'https://occ-0-64-33.1.nflxso.net/dnm/api/v6/6gmvu2hxdfnQ55LZZjyzYR4kzGk/AAAABRwuS9u6qnSqe9jHPTLgnTo7AFdZAZM1rZ-z-jA_h1960CwRv63bUeSLO9svPp7enVpGiH7yxzdPVyY0Sp8AcTXTPwLjVB28thfg.jpg?r=9ff',
                uniqueCard: false,
              );
            }),
          ),
        )
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
                        style: const TextStyle(fontSize: 100, color: kBlack,fontWeight: FontWeight.bold),
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
