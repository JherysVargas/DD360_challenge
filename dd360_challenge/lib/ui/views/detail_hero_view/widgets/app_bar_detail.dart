import 'package:cached_network_image/cached_network_image.dart';
import 'package:dd360_challenge/core/view_models/view_models.dart';
import 'package:dd360_challenge/models/models.dart';
import 'package:dd360_challenge/ui/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarDetail extends StatelessWidget {
  const AppBarDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MarvelViewModel, MarvelState, HeroModel>(
      selector: (state) => state.selectedHero,
      builder: (context, selectedHero) {
        return SliverAppBar(
          expandedHeight: 300,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Hero(
              tag: selectedHero.id!,
              child: CachedNetworkImage(
                imageUrl:
                    "${selectedHero.thumbnail!.path}.${selectedHero.thumbnail!.extension}",
                fit: BoxFit.cover,
                alignment: Alignment.center,
                progressIndicatorBuilder: (_, __, ___) => const LoadingWidget(),
                errorWidget: (_, __, ___) => const Icon(Icons.warning),
              ),
            ),
          ),
        );
      },
    );
  }
}
