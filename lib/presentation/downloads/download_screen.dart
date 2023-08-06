import 'package:flutter/material.dart';
import 'package:netflix/presentation/downloads/widgets/indroducing.dart';
import 'package:netflix/presentation/downloads/widgets/set_up.dart';
import 'package:netflix/presentation/downloads/widgets/smart_downloads.dart';
import 'package:netflix/presentation/widgets/appbar_widget.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final widgetList = [
      SmartDownloads(),
      Indroducing(),
      const SetUp(),
    ];

    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              title: 'Downloads',
            )),
        body: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemBuilder: ((context, index) {
            return widgetList[index];
          }),
          separatorBuilder: ((context, index) {
            return const SizedBox(
              height: 30,
            );
          }),
          itemCount: widgetList.length,
        ));
  }
}
