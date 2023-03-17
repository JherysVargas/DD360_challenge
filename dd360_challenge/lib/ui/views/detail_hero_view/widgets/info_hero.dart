import 'package:dd360_challenge/core/view_models/view_models.dart';
import 'package:dd360_challenge/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoHero extends StatelessWidget {
  const InfoHero({super.key});

  static const TextStyle _textStyleName = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle _textStyleDescription = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MarvelViewModel, MarvelState, HeroModel>(
      selector: (state) => state.selectedHero,
      builder: (context, selectedHero) {
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(selectedHero.name!, style: _textStyleName),
                Text(selectedHero.description!, style: _textStyleDescription),
              ],
            ),
          ),
        );
      },
    );
  }
}
