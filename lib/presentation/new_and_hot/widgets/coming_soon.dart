import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constans.dart';
import 'package:netflix/infrastructure/api.dart';
import 'package:netflix/model/movie_info.dart';
import 'package:netflix/presentation/new_and_hot/widgets/image_with_soundicon.dart';
import 'package:netflix/presentation/widgets/icon_with_label.dart';
import 'package:netflix/presentation/widgets/title_with_content.dart';

class ComingSoonWidget extends StatelessWidget {
  final MovieInfoModel movieInfo;
  const ComingSoonWidget({
    required this.movieInfo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apikey';

    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 5,right: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          SizedBox(
            height: size.height * 0.6,
            width: 50,
            child:  Column(
              children: [
                 Text(
                    fetchDate(movieInfo.releaseDate!),
                    style: const TextStyle(
                        fontSize: 25,
                        color: kWhite,
                        fontWeight: FontWeight.bold),
                  ),
              ],
            ),
          ),
          SizedBox(
            width: size.width - 60,
            
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageWithSoundIcon(videoImage: imageUrl),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 175,
                  
                      child: Text(
                        movieInfo.originalTitle??'No Title Found',
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                            letterSpacing: -3,
                            fontSize: 38,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        IconWithLabel(
                            iconSize: 25,
                            textSize: 12,
                            icon: Icons.notifications_none_outlined,
                            title: 'Remind Me',
                            vertical: 5,
                            horizontal: 0),
                        IconWithLabel(
                            iconSize: 25,
                            textSize: 12,
                            icon: Icons.info_outline,
                            title: 'Info',
                            vertical: 5,
                            horizontal: 10)
                      ],
                    )
                  ],
                ),
                Text(
                  'Coming on ${fetchDay(movieInfo.releaseDate!)}',
                  style: TextStyle(fontSize: 16),
                ),
                kHeight20,
                Row(
                  children: [
                    Image(
                      image: AssetImage('lib/assets/images/netFlix.png'),
                      width: 10,
                    ),
                    kWidth,
                    Text(
                      'FILM',
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
                TitleWithContent(
                  content:
                   movieInfo.overview,
                  title: movieInfo.originalTitle ?? 'Empty Title',
                  
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

   String fetchDate(String date) {
    //convert date in string format to date format
    DateTime dateInFormat = DateTime.parse(date);
    final formatDate = (DateFormat.MMMMd().format(dateInFormat)).split(" ");
    //add \n to make it in the displayable format eg:
    //APR
    //5
    return "${formatDate.first.substring(0, 3)} \n${formatDate.last} ";
  }

  String fetchDay(String date) {
    DateTime dateInFormat = DateTime.parse(date);
    final dayName = DateFormat('EEEE').format(dateInFormat);
    return dayName;
  }
}


