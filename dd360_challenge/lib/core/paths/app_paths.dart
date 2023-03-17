import 'package:flutter/material.dart';
import 'package:dd360_challenge/ui/views/home_view/home_view.dart';
import 'package:dd360_challenge/ui/views/detail_hero_view/detail_hero_view.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routesMap = {
      '/': MaterialPageRoute(
        builder: (_) => const HomeView(),
      ),
      '/detailHero': PageRouteBuilder(
        pageBuilder: (_, __, ___) => const DetailHeroView(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 350),
        settings: settings,
      ),
    };

    return routesMap[settings.name!] ?? routesMap['/']!;
  }
}
