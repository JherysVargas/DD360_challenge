import 'package:flutter/material.dart';
import 'widgets/app_bar_detail.dart';

import 'widgets/info_hero.dart';
import 'widgets/list_comics.dart';
import 'widgets/list_events.dart';
import 'widgets/list_series.dart';
import 'widgets/list_stories.dart';

class DetailHeroView extends StatefulWidget {
  const DetailHeroView({super.key});

  @override
  State<DetailHeroView> createState() => _DetailHeroViewState();
}

class _DetailHeroViewState extends State<DetailHeroView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            AppBarDetail(),
            InfoHero(),
            ListComics(),
            ListEvents(),
            ListSeries(),
            ListStories(),
          ],
        ),
      ),
    );
  }
}
