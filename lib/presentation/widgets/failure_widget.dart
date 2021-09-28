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
          Image.asset('assets/no-philosophers.gif', height: 100.0, ),
          Text(reason, style: kErrorTextStyle,)
        ],
      ),
    );
  }
}
