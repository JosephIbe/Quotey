import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:quotey/utils/constants.dart';

class QuoteItem extends StatelessWidget {

  final String text;
  final String author;

  QuoteItem({@required this.text, @required this.author,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 300.0,
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: Stack(
        children: [
          Icon(Icons.format_quote_sharp, color: Colors.white70.withOpacity(0.4), size: 290.0,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text, style: kQuoteTextStyle,),
              SizedBox(height: MediaQuery.of(context).size.height * .15,),
              Row(
                children: [
                  SizedBox(
                    width: 25.0,
                    child: Divider(color: Colors.white, thickness: 2.0, height: 1.5,),
                  ),
                  SizedBox(width: 15.0,),
                  Expanded(
                    child: Text(author, textAlign: TextAlign.center, style: kQuoteAuthorStyle, overflow: TextOverflow.visible, maxLines: 3,),
                  ),
                  SizedBox(width: 15.0,),
                  SizedBox(
                    width: 25.0,
                    child: Divider(color: Colors.white, thickness: 2.0, height: 1.5,),
                  ),
                ],
              )
            ],
          ),
        ],
      )
    );
  }
}
