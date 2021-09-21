import 'package:flutter/material.dart';
import 'package:quotey/presentation/journeys/screens/home_view.dart';
import 'package:quotey/utils/strings.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeView());
        break;
      // case policyRoute:
      //   return MaterialPageRoute(builder: (_) => PolicyView());
      // case faqsRoute:
      //   return MaterialPageRoute(builder: (_) => FAQSView());
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
