import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constans.dart';

// ignore: unused_element
class SmartDownloads extends StatelessWidget {
   const SmartDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    return   const Row(
      children: [
        
        Icon(
          Icons.settings,
          color: kWhite,
        ),
        kWidth,
        Text('Smart Downloads'),
      ],
    );
  }
}