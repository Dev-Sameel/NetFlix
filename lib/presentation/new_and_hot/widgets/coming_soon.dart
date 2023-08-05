import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constans.dart';
import 'package:netflix/presentation/new_and_hot/widgets/image_with_soundicon.dart';
import 'package:netflix/presentation/widgets/icon_with_label.dart';
import 'package:netflix/presentation/widgets/title_with_content.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      
      children: [
        
        SizedBox(
          height: size.height * 0.6,
          width: 50,
          child: const Column(
            children: [
              Text(
                'FEB',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20, color: kGrey),
              ),
              Text(
                '11',
                style: TextStyle(
                    letterSpacing: 4,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ],
          ),
        ),
        Stack(
          children: [
            SizedBox(
              width: size.width - 50,
              height: size.height * 0.65,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageWithSoundIcon(image: 'https://img1.hotstarext.com/image/upload/f_auto,t_hcdl/sources/r1/cms/prod/6661/846661-h'),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Mulan',
                        style: TextStyle(
                            letterSpacing: -3,
                            fontSize: 45,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          IconWithLabel(
                              iconSize: 25,
                              textSize: 12,
                              icon: Icons.notifications_none_outlined,
                              title: 'Remind Me',
                              vertical: 0,
                              horizontal: 0),
                          IconWithLabel(
                              iconSize: 25,
                              textSize: 12,
                              icon: Icons.info_outline,
                              title: 'Info',
                              vertical: 0,
                              horizontal: 20)
                        ],
                      )
                    ],
                  ),
                  Text(
                    'Coming on Friday',
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
                        'A girl disguises as a male warrior and joins the imperial army in order to prevent her sick father from being forced to enlist as he has no male heir.',
                    title: 'Mulan',
                    
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}


