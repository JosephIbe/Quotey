import 'package:flutter/material.dart';

double w, h;

class AuthorsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: w,
        height: h,
        child: Center(
          child: Text('Authors View'),
        ),
      ),
    );
  }
}