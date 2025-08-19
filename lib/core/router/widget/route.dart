

import 'package:flutter/material.dart';
import 'package:listen_ai/core/router/widget/routing.dart';

import '../../../presentation/Home/screen/home_screen.dart';
import '../../../presentation/add_content/screen/add_content.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RoutesName.splashPage:
      //   return MaterialPageRoute(builder: (_) => Splash());
    case RoutesName.homePage:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RoutesName.contentpage:
        return MaterialPageRoute(builder: (_) => AddContent());
  /* case RoutesName.translate:
        return MaterialPageRoute(builder: (_) => Translator());
      case RoutesName.startlearning:
        return MaterialPageRoute(builder: (_)=>StartLearning());
      case RoutesName.greeting:
        return MaterialPageRoute(builder: (_)=>Greeting());
      case RoutesName.categoryType:
        if (settings.arguments is CategoryItem) {
          final args = settings.arguments as CategoryItem;
          return MaterialPageRoute(
            builder: (_) => CategoryType(item: args),
          );
        }
        // fallback if no arguments or wrong type
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("No valid CategoryItem passed!"),
            ),
          ),
        );

      case RoutesName.categoryscreen:
        return MaterialPageRoute(builder: (_)=>Category_screen());
*/
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
            body: Center(
              child: Text('No route defined for "${settings.name}"'),
            ),
          ),
        );
    }
  }
}
