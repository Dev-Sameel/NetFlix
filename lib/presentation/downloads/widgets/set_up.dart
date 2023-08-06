import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constans.dart';

class SetUp extends StatelessWidget {
  const SetUp({super.key});

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