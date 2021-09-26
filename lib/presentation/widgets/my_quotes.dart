import 'package:flutter/material.dart';
import 'package:quotey/utils/constants.dart';

class MyQuotes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 300.0,
        color: Colors.grey,
        child: Center(
          child: Text('Your Quotes Will Appear Here...', style: kEmptyFavoriteQuotesTextStyle,),
        ),
      ),
    );
  }

}