import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constans.dart';
import 'package:netflix/domain/apiendpoint.dart';
import 'package:netflix/infrastructure/base_client.dart';
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
    return FutureBuilder(
        future: apicall(ApiEndPoints.upcoming),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            const Center(
              child: Column(
                children: [
                  CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                  Text('Please wait'),
                ],
              ),
            );
          }

          if (snapshot.data == null) {
            return const Text('No data found');
          }
          return ListView.separated(
            separatorBuilder: (context, index) => kHeight50,
            itemBuilder: (BuildContext context, int index) {
              return  ComingSoonWidget(movieInfo: snapshot.data.results[index]);
            },
            itemCount: snapshot.data.results.length,
          );
        });
  }

  Widget _buildEveryonesWatching() {
    return  FutureBuilder(
        future: apicall(ApiEndPoints.moviepopular),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
             Center(
              child: Column(
                children: [
                  CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                  Text('Please wait'),
                ],
              ),
            );
          }
          if (snapshot.data == null) {
            return const Text('No data found');
          }
          return ListView.builder(
      itemBuilder: (context, index) =>  EveryonesWatching(movieInfo: snapshot.data.results[index]),
     itemCount: snapshot.data.results.length,);
});
  }
}
