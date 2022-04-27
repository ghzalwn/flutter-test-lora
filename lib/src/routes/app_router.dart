import 'package:asklora_flutter_test/src/screens/favorite_screen.dart';
import 'package:asklora_flutter_test/src/screens/home_screen.dart';
import 'package:asklora_flutter_test/src/screens/list_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String homeScreen = "/";
  static const String listScreen = "/list";
  static const String favoriteScreen = "/favorite";

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case listScreen:
        return MaterialPageRoute(builder: (_) => ListScreen());
      case favoriteScreen:
        return MaterialPageRoute(builder: (_) => FavoriteScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic>? _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('Page Not Found !'),
          ),
        );
      },
    );
  }
}
