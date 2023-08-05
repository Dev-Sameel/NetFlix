import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class IconWithLabel extends StatelessWidget {
  final String title;
  final IconData icon;
  final double vertical;
  final double horizontal;
  final double iconSize;
  final double textSize;
  const IconWithLabel({super.key, this.iconSize=30,this.textSize=16,
  required this.icon,required this.title,required this.vertical,required this.horizontal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: vertical,horizontal: horizontal),
      child: Column(
        children: [
          Icon(icon,size: iconSize,color: kWhite,),
          Text(title,style:  TextStyle(fontSize: textSize),),
        ],
      ),
    );
  }
}