import 'package:flutter/material.dart';

import 'package:netflix/presentation/downloads/download_screen.dart';
import 'package:netflix/presentation/fast_laugh/fast_laugh_screen.dart';
import 'package:netflix/presentation/home/home_screen.dart';
import 'package:netflix/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix/presentation/new_and_hot/new_and_hot_screen.dart';
import 'package:netflix/presentation/search/search_screen.dart';

class MainPageScreen extends StatelessWidget {
  const MainPageScreen({super.key});

  final pages = const [
    HomeScreen(),
    NewHotScreen(),
    FastLaugh(),
    SearchScreen(),
    DownloadScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: changeIndexNotifier,
          builder: (context, int index, _) {
            return pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
