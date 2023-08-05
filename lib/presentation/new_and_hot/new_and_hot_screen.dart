import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constans.dart';
import 'package:netflix/presentation/new_and_hot/widgets/coming_soon.dart';
import 'package:netflix/presentation/new_and_hot/widgets/everyones_watching.dart';
import 'package:netflix/presentation/widgets/appbar_widget.dart';


class NewHotScreen extends StatelessWidget {
  const NewHotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(105),
            child: Column(
              children: [
                const AppBarWidget(
                  title: 'New & Hot',
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TabBar(
                    isScrollable: true,
                    labelColor: kBlack,
                    labelStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    indicator:
                        BoxDecoration(color: kWhite, borderRadius: kRadius30),
                    unselectedLabelColor: kWhite,
                    tabs: const [
                      Tab(
                        text: '🍿 Coming Soon',
                      ),
                      Tab(
                        text: "👀 Everyone's watching",
                      )
                    ],
                  ),
                )
              ],
            )),
        body: TabBarView(
            children: [_buildComingSoon(), _buildEveryonesWatching()]),
      ),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(itemBuilder: (BuildContext context,int index) 
    {
      return const ComingSoonWidget();
    },
    itemCount: 10,);
  }

  Widget _buildEveryonesWatching() {
    return ListView.builder(itemBuilder:(context, index) =>  const EveryonesWatching(),itemCount: 10, );
   
  }
}

