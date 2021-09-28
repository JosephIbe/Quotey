import 'package:flutter/material.dart';
import 'package:quotey/presentation/journeys/screens/category_quotes_view.dart';
import 'package:quotey/presentation/journeys/screens/home_view.dart';
import 'package:quotey/utils/strings.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeView());
        break;
      case categoryQuotesRoute:
        return MaterialPageRoute(builder: (_) => CategoryQuotesView(categoryName: settings.arguments));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route specified for ${settings.name}'),
                  ),
                ));
    }
  }
}
