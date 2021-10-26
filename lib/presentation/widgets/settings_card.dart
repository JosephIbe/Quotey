import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quotey/utils/constants.dart';

class SettingsCard extends StatelessWidget {

  final IconData icon;
  final String title;
  final IconData trailingIcon;
  final Function onTap;

  SettingsCard({
    @required this.icon,
    @required this.title,
    this.trailingIcon,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.accents[Random().nextInt(Colors.accents.length)],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: ListTile(
          onTap: onTap,
          title: Text(title, style: kSettingsCardTitleTextStyle,),
          leading: Icon(icon, color: Colors.white,),
          trailing: Icon(trailingIcon, color: Colors.white,),
        ),
      ),
    );
  }

}
