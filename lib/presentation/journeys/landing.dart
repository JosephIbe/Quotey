import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quotey/presentation/journeys/screens/categories_view.dart';
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
    // FavoritesView(),
    AuthorsView(),
    CategoriesView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: QuoteyAppBar(
          title: "Quotey",
          height: 75.0,
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
          items: [
            BottomNavyBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                activeColor: Colors.black,
                inactiveColor: Colors.grey
            ),
            // BottomNavyBarItem(
            //     icon: Icon(Icons.favorite),
            //     title: Text('Favorites'),
            //     activeColor: Colors.black,
            //     inactiveColor: Colors.grey
            // ),
            BottomNavyBarItem(
                icon: Icon(Icons.person),
                title: Text('Authors'),
                activeColor: Colors.black,
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
                title: Text('Settings'),
                activeColor: Colors.black,
                inactiveColor: Colors.grey
            ),
          ],
        ),
      ),
    );
  }
}
