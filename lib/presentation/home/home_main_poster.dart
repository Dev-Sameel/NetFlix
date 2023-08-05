import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constans.dart';
import 'package:netflix/presentation/widgets/icon_with_label.dart';

class HomeMainPoster extends StatelessWidget {
  // final IconData icon;
  // final String title;
  const HomeMainPoster({
    super.key,
    // required this.icon,
    // required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/images/moneyHeist.jpg'),
                  fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const IconWithLabel(icon: Icons.add, title: 'MyList', vertical:10, horizontal: 0),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_arrow,
                    size: 30,
                  ),
                  label: const Text('Play', style: kWeight),
                  style: const ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(kBlack),
                      backgroundColor: MaterialStatePropertyAll(kWhite)),
                ),
               const IconWithLabel(icon: Icons.info_outline, title: 'Info', vertical: 0, horizontal: 0)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

