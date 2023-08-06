import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constans.dart';
import 'package:netflix/domain/apiendpoint.dart';
import 'package:netflix/infrastructure/api.dart';
import 'package:netflix/infrastructure/base_client.dart';
import 'package:netflix/model/movie_info.dart';
import 'package:netflix/presentation/search/widgets/title.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/q7vmCCmyiHnuKGMzHZlr0fD44b9.jpg';

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
          child: FutureBuilder(
                future: apicall(ApiEndPoints.trendingall),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                     Center(
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
                    return const Text("No data found");
                  }
                  return ListView.separated(
            //or use singleChildScrollView instead of ListView
            shrinkWrap: true,
            itemBuilder: (ctx, index) =>  TopSearchItem( movieInfo: snapshot.data.results[index],),
            separatorBuilder: (ctx, index) => kHeight20,
            itemCount: 10,);
}
)
)
      ],
    );
  }
}



class TopSearchItem extends StatelessWidget {
  final MovieInfoModel movieInfo;
  const TopSearchItem({super.key,required this.movieInfo});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    String url =
        'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apikey';
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration:  BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(url))),
        ),
         Expanded(
            child: Text(
          movieInfo.title ?? "No Movie Name Found",
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
