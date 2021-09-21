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
      width: 250.0,
      height: 250.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('', height: 100.0, ),
          Text(reason, style: kErrorTextStyle,)
        ],
      ),
    );
  }
}
