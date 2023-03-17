import 'package:flutter/material.dart';
import 'widgets/app_bar_detail.dart';
import 'widgets/info_hero.dart';

class DetailHeroView extends StatefulWidget {
  const DetailHeroView({super.key});

  @override
  State<DetailHeroView> createState() => _DetailHeroViewState();
}

class _DetailHeroViewState extends State<DetailHeroView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarDetail(),
          InfoHero(),
        ],
      ),
    );
  }
}
