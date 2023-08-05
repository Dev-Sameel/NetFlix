import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constans.dart';

class TitleWithContent extends StatelessWidget {
  final String title;
  final double tSize;
  final String content;
  final CrossAxisAlignment colAlign;
  final TextAlign txtAlign;

  const TitleWithContent(
      {super.key,
      this.txtAlign=TextAlign.left,
      this.colAlign=CrossAxisAlignment.start,
      this.tSize = 24.5,
      required this.content,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: colAlign,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kWhite, fontSize: tSize, fontWeight: FontWeight.bold),
        ),
        kHeight,
        Text(
          content,
          textAlign: txtAlign,
          style: const TextStyle(fontSize: 16, color: kGrey),
        ),
      ],
    );
  }
}
