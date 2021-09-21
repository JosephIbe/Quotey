import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quotey/utils/constants.dart';

double w, h;

class CatalogView extends StatelessWidget {

  final categories = [
    'Discipline', 'Motivation', 'Inspiration',
    'Movie Quotes', 'Bible Verses', 'Famous Authors',
  ];

  @override
  Widget build(BuildContext context) {

    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: w,
        height: h,
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0
          ),
          itemBuilder: (context, index) {
            return Container(
                constraints: BoxConstraints(
                  minWidth: 150.0,
                  maxWidth: 200.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    categories[index],
                    style: kCategoryTitleTextStyle,
                    textAlign: TextAlign.center,
                  ),
                )
            );
          },
        ),
      )
    );
  }
}