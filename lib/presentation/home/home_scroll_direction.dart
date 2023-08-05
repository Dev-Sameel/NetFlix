import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constans.dart';
import 'package:netflix/presentation/widgets/appbar_widget.dart';

// ignore: non_constant_identifier_names
AnimatedContainer HomeScrollDirection() {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 1000),
    child: Container(
        width: double.infinity,
        height: 90,
        color: Colors.black.withOpacity(0.3),
        child: Column(
          children: [
            const AppBarWidget(
                image:
                    netflixIcon),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text('TV Shows',
                        style: kWS)),
                TextButton(
                    onPressed: () {},
                    child: const Text('Movies',
                        style: kWS)),
                DropdownButton(
                  dropdownColor: kBlack,
                  items: const [
                    DropdownMenuItem(
                        child: Text(
                      'Categories',
                      style: kWS,
                    ))
                  ],
                  onChanged: (value) {},
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: kWhite,
                  ),
                  underline: const SizedBox(),
                )
              ],
            ),
          ],
        )),
  );
}
