import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constans.dart';
import 'package:netflix/presentation/search/widgets/title.dart';

const imageUrl =
    'https://www.scrolldroll.com/wp-content/uploads/2023/04/cargo-best-apocalyptic-movies-on-netflix-scaled.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Top Searches'),
        kHeight,
        Expanded(
          child: ListView.separated(
            //or use singleChildScrollView instead of ListView
            shrinkWrap: true,
            itemBuilder: (ctx, index) => const TopSearchItem(),
            separatorBuilder: (ctx, index) => kHeight20,
            itemCount: 10,
          ),
        )
      ],
    );
  }
}



class TopSearchItem extends StatelessWidget {
  const TopSearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl))),
        ),
        const Expanded(
            child: Text(
          'Movie Name',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        )),
        const Image(
          image: AssetImage('lib/assets/images/playButton.png'),
          width: 50,
          color: kWhite,
        )
      ],
    );
  }
}
