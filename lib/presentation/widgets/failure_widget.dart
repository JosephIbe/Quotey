import 'package:flutter/material.dart';

import 'package:quotey/utils/constants.dart';

class FailureWidget extends StatelessWidget {

  final String reason;
  FailureWidget({@required this.reason});

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
          Image.asset('assets/no-philosophers.gif', height: 350.0, width: 350.0, ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Text(reason, style: kErrorTextStyle, textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }
}
