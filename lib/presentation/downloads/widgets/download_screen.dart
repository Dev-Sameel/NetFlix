import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constans.dart';

import 'package:netflix/presentation/widgets/appbar_widget.dart';
import 'package:netflix/presentation/widgets/title_with_content.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final widgetList = [const _SmartDownloads(), Section2(), const Section3()];

    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              title: 'Downloads',
            )),
        body: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemBuilder:((context, index) {
            return widgetList[index];
          }),
          separatorBuilder:((context, index) {
            return const SizedBox(height: 30,);
          }),
          itemCount: widgetList.length,
        ));
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: () {},
            color: kBlue,
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Text(
                'Set Up',
                style: TextStyle(
                    color: kWhite, fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          onPressed: () {},
          color: kWhite,
          child: const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Text(
              'See what you can download',
              style: TextStyle(
                  color: kBlack, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        )
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});

  final List imageList = [
    'https://m.media-amazon.com/images/M/MV5BMTY0MDUwNzg5OV5BMl5BanBnXkFtZTgwNTY4NjU3MzI@._V1_.jpg',
    'https://lumiere-a.akamaihd.net/v1/images/avatar_800x1200_208c9665.jpeg?region=0%2C0%2C800%2C1200',
    'https://www.themoviedb.org/t/p/original/reEMJA1uzscCbkpeRJeTT2bjqUp.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const TitleWithContent(content: "We'll download a personalised selection of\nmovies and shows for you, so there's\nalways something to watch on your\ndevice.", title: "Introducing Downloads for you",colAlign: CrossAxisAlignment.center,txtAlign: TextAlign.center),
        kHeight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                  child: CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.5),
                radius: size.width * 0.4,
              )),
              DownloadsImageWidget(
                angle: 20,
                imageList: imageList[0],
                margin: const EdgeInsets.only(left: 130, bottom: 50, top: 20),
                size: Size(size.width * 0.4, size.width * 0.58),
              ),
              DownloadsImageWidget(
                  angle: -20,
                  imageList: imageList[1],
                  margin:
                      const EdgeInsets.only(right: 130, bottom: 50, top: 20),
                  size: Size(size.width * 0.4, size.width * 0.58)),
              DownloadsImageWidget(
                  imageList: imageList[2],
                  margin: const EdgeInsets.only(top: 10),
                  size: Size(size.width * 0.45, size.width * 0.65))
            ],
          ),
        ),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget(
      {super.key,
      this.angle = 0,
      required this.imageList,
      required this.margin,
      required this.size});

  final double angle;
  final String imageList;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: kBlack,
            image: DecorationImage(
                image: NetworkImage(imageList), fit: BoxFit.cover)),
      ),
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads();

  @override
  Widget build(BuildContext context) {
    return const Row(
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
