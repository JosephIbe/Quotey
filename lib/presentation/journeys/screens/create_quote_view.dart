import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateQuoteView extends StatefulWidget {
  @override
  _CreateQuoteViewState createState() => _CreateQuoteViewState();
}

class _CreateQuoteViewState extends State<CreateQuoteView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/coming-soon.gif', ),
              // SizedBox(height: 20.0,),
              // Text('Stay Tuned', style: TextStyle(fontSize: 25.0),),
            ],
          ),
        ),
      ),
    );
  }
}