import 'package:flutter/material.dart';

import 'package:quotey/presentation/widgets/latest_quotes.dart';

double w, h;

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: w,
        height: h,
        color: Colors.white,
        padding: EdgeInsets.all(10.0),
        child: LatestQuotes(),
      ),
    );
  }
}
