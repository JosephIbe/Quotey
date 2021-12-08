import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quotey/presentation/journeys/screens/categories_view.dart';
import 'package:quotey/presentation/journeys/screens/create_quote_view.dart';
import 'package:quotey/presentation/widgets/quotey_app_bar.dart';

import 'package:quotey/utils/constants.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import 'screens/home_view.dart';
import 'screens/authors_view.dart';
import 'screens/categories_view.dart';
import 'screens/settings_view.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {

  var currentIndex = 0;
  var _screens = [
    HomeView(),
    AuthorsView(),
    CreateQuoteView(),
    CategoriesView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: QuoteyAppBar(
          title: "Quotey",
          height: 60.0,
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        ),
        body: _screens[currentIndex],
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: currentIndex,
          showElevation: true,
          onItemSelected: (index) => setState(() {
            currentIndex = index;
          }),
          backgroundColor: Colors.white,
          animationDuration: Duration(milliseconds: 800),
          containerHeight: 55.0,
          iconSize: currentIndex == 2 ? 30 : 20.0,
          items: [
            BottomNavyBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                activeColor: Colors.black,
                inactiveColor: Colors.grey
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.person),
                title: Text('Authors'),
                activeColor: Colors.black,
                inactiveColor: Colors.grey
            ),
            BottomNavyBarItem(
                icon: ClipRRect(
                  child: Icon(Icons.add_circle_outlined, color: Colors.green, ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                title: Text('My Quotes'),
                activeColor: Colors.green,
                inactiveColor: Colors.grey
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.category_outlined),
                title: Text('Categories'),
                activeColor: Colors.black,
                inactiveColor: Colors.grey
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.settings),
                title: Text('More'),
                activeColor: Colors.black,
                inactiveColor: Colors.grey
            ),
          ],
        ),
      ),
    );
  }
}
