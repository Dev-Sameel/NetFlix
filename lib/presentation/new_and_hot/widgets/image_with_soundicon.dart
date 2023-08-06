import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class ImageWithSoundIcon extends StatelessWidget {
  final String videoImage;
  const ImageWithSoundIcon({
    required this.videoImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         Image(
          fit: BoxFit.cover,
            image: NetworkImage(
                videoImage)),
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