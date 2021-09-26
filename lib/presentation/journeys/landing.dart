import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quotey/presentation/journeys/screens/categories_no_bloc.dart';
import 'package:quotey/presentation/widgets/quotey_app_bar.dart';

import 'package:quotey/utils/constants.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import 'screens/home_view.dart';
import 'screens/favorites_view.dart';
import 'screens/add_quote_view.dart';
import 'screens/categories_view.dart';
import 'screens/profile_view.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {

  var currentIndex = 0;
  var _screens = [
    HomeView(),
    FavoritesView(),
    AddQuoteView(),
    // CategoriesView(),
    CategoriesViewNoBloc(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: QuoteyAppBar(height: 75.0, color: Colors.primaries[Random().nextInt(Colors.primaries.length)],),
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
            BottomNavyBarItem(
                icon: Icon(Icons.favorite),
                title: Text('Favorites'),
                activeColor: Colors.black,
                inactiveColor: Colors.grey
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.add_box_rounded),
                title: Text('Create'),
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
                icon: Icon(Icons.person),
                title: Text('Profile'),
                activeColor: Colors.black,
                inactiveColor: Colors.grey
            ),
          ],
        ),
      ),
    );
  }
}
