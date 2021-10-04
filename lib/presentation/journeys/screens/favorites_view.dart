import 'dart:math';

import 'package:flutter/material.dart';

import 'package:quotey/data/models/quotes_model.dart';

import 'package:quotey/utils/constants.dart';

import 'package:hive/hive.dart';

double w, h;

class FavoritesView extends StatelessWidget {

  final Color color = Colors.primaries[Random().nextInt(Colors.primaries.length)];

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
        child: box.values.toList().isEmpty
            ? Column(
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
        )
        : ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: box.values.length,
          itemBuilder: (context, index) {

            final quote = box.values.toList()[index];

            return Card(
              color: color,
              elevation: 4.0,
              shadowColor: color,
              margin: EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Container(
                  margin: EdgeInsets.all(8.0),
                  height: MediaQuery.of(context).size.height * 0.72,
                  decoration: BoxDecoration(
                    color: color,
                  ),
                  child: Stack(
                    children: [
                      Icon(
                        Icons.format_quote_sharp,
                        color: Colors.white70.withOpacity(0.4),
                        size: 350.0,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.delete_forever,
                                    color: Colors.red,
                                    size: 40.0,
                                  ),
                                  onPressed: () => {},
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .05,
                            ),
                            Text(
                              quote.content ?? 'Empty Quote',
                              style: kQuoteTextStyle,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .08,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 25.0,
                                    child: Divider(
                                      color: Colors.white,
                                      thickness: 2.0,
                                      height: 1.5,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      quote.author ?? 'Unknown Author',
                                      textAlign: TextAlign.center,
                                      style: kQuoteAuthorStyle,
                                      overflow: TextOverflow.visible,
                                      maxLines: 3,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25.0,
                                    child: Divider(
                                      color: Colors.white,
                                      thickness: 2.0,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
              ),
            );
          },
        )
      ),
    );
  }
}