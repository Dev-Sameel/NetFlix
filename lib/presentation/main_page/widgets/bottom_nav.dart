import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

ValueNotifier<int> changeIndexNotifier = ValueNotifier(0);

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: changeIndexNotifier, builder: (context,int newIndex, _) {
      return BottomNavigationBar(
      backgroundColor: kBlack,
      currentIndex: newIndex,
      onTap: (index) {
        changeIndexNotifier.value = index;
      },
    
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
       BottomNavigationBarItem(icon: Icon(Icons.collections),label: 'New & Hot'),
        BottomNavigationBarItem(icon: Icon(Icons.emoji_emotions),label: 'Fast Laughs'),
         BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.download),label: 'Downloads')
    ]);
      
    },);
  }
}