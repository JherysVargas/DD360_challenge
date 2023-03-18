import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dd360_challenge/models/models.dart';
import 'package:dd360_challenge/core/view_models/view_models.dart';

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
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      sliver: SliverToBoxAdapter(
        child: BlocSelector<MarvelViewModel, MarvelState, HeroModel>(
          selector: (state) => state.selectedHero,
          builder: (context, selectedHero) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildName(selectedHero.name!),
                const SizedBox(height: 10),
                if (selectedHero.description!.isNotEmpty)
                  _buildDescriptin(selectedHero.description!),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildName(String name) {
    return Text(name, style: _textStyleName);
  }

  Widget _buildDescriptin(String description) {
    return Text(description, style: _textStyleDescription);
  }
}
