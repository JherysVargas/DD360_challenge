import 'package:flutter/material.dart';
import 'package:dd360_challenge/ui/home_view/home_view.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routesMap = {
      '/': MaterialPageRoute(
        builder: (_) => const HomeView(),
      ),
    };

    return routesMap[settings.name!] ?? routesMap['/']!;
  }
}
