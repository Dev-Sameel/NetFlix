import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class ImageWithSoundIcon extends StatelessWidget {
  final String image;
  const ImageWithSoundIcon({
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         Image(
            image: NetworkImage(
                image)),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.5),
              radius: 20,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.volume_off,
                    color: kWhite,
                    size: 20,
                  ))),
        ),
      ],
    );
  }
}