import 'package:flutter/material.dart';
import 'package:netflix/core/constans.dart';
import 'package:netflix/presentation/search/widgets/search_result.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  final double height ;
  final double width;
  final bool uniqueCard;
  final String title;
  final String url;
  const MainTitleCard({
    super.key,
    required this.uniqueCard,
    required this.title,
    required this.url,
    this.height=250,
    this.width=150
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
       MainTitle(title: title),
      kHeight,
      LimitedBox(
        maxHeight: 200,
        
        child: ListView(scrollDirection: Axis.horizontal,children: List.generate(10, (index) =>  Padding(
          padding: const EdgeInsets.only(right: 13),
          child: MainCard(height: height,width: width,url: url,uniqueCard: uniqueCard,index: index+1),
        )),))
      
          ],
        ),
    );
  }
}