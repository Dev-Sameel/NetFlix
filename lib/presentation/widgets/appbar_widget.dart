import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constans.dart';

class AppBarWidget extends StatelessWidget {
  final String? image;
  final String? title;
  const AppBarWidget({super.key, this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
    // appBar: AppBar(actions: [AppBarWidget(title: 'New & Hot',),],)
      
      children: [
        kWidth,
        image == null
            ? Text('$title',
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold))
            : Image(
                image: NetworkImage('$image'),
                width: 40,
              ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: kWhite,
          size: 30,
        ),
        kWidth,
        Container(
          color: Colors.blue,
          width: 28,
          height: 28,
        ),
        kWidth
      ],
    );
  }
}
