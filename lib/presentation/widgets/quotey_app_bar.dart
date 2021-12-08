import 'package:flutter/material.dart';
import 'package:quotey/utils/constants.dart';

class QuoteyAppBar extends StatelessWidget implements PreferredSizeWidget {

  final Color color;
  final double height;
  final String title;

  QuoteyAppBar({@required this.height, @required this.color, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      // padding: EdgeInsets.fromLTRB(0, 5.0, 5.0, 0),
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: Row(
          children: [
            Container(
              width: 45.0,
              height: 45.0,
              margin: EdgeInsets.only(right: 15.0),
              decoration: BoxDecoration(
                // color: color,
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                )
              ),
              child: Icon(Icons.format_quote_sharp, size: 35.0,),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Text(title, style: kAppNameTextStyle, ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
