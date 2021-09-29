import 'package:flutter/material.dart';

import 'package:quotey/data/models/quotes_model.dart';

import 'package:quotey/utils/constants.dart';

import 'package:hive/hive.dart';

double w, h;

class FavoritesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final box = Hive.box<QuotesModel>('favorite-quotes');
    print('items saved total:\t${box.length}');

    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: w,
        height: h,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/empty-favorites.gif', height: 150.0,),
            SizedBox(height: 20.0,),
            Text(
              'Your Favorite Quotes can be Found here',
              style: kEmptyFavoriteQuotesTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
