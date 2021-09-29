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
          Image.asset('assets/loading.gif', height: 100.0, ),
          Text(text, style: kLoadingTextStyle,)
        ],
      ),
    );
  }
}
