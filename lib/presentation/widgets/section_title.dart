import 'package:flutter/material.dart';
import 'package:quotey/utils/constants.dart';

class SectionTitle extends StatelessWidget {

  final String text;
  SectionTitle({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.0,),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
          child: Text(text, style: kSectionTitleTextStyle, textAlign: TextAlign.start,),
        ),
        SizedBox(height: 10.0,),
      ],
    );
  }
}
