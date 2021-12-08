import 'package:flutter/material.dart';
import 'package:quotey/utils/constants.dart';

class AppLoader extends StatelessWidget {

  final String text;
  AppLoader({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/writing-2.gif', height: 100.0, ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Text(text, style: kLoadingTextStyle, textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }
}
