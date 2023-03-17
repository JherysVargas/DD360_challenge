import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dd360_challenge/models/models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dd360_challenge/ui/widgets/loading_widget.dart';
import 'package:dd360_challenge/core/view_models/view_models.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ListHerosMarvel extends StatefulWidget {
  const ListHerosMarvel({super.key});

  @override
  State<ListHerosMarvel> createState() => _ListHerosMarvelState();
}

class _ListHerosMarvelState extends State<ListHerosMarvel> {
  int _currentOffSet = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<MarvelViewModel>().fetchHeros(_currentOffSet);
    _scrollController.addListener(listenerScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(listenerScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double paddingBottom = MediaQuery.of(context).padding.bottom;
    return BlocBuilder<MarvelViewModel, MarvelState>(
      builder: (_, state) {
        final bool loading = state.loadingData;
        final List<HeroModel> results = state.data;

        return MasonryGridView.builder(
          controller: _scrollController,
          padding: EdgeInsets.fromLTRB(8, 6, 8, (paddingBottom + 10)),
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          itemCount: loading ? 10 : results.length,
          itemBuilder: (context, index) {
            final HeroModel hero = loading ? const HeroModel() : results[index];

            return _buildItem(hero, loading);
          },
        );
      },
    );
  }

  Widget _buildItem(HeroModel hero, bool loading) {
    return GestureDetector(
      onTap: () {
        if (!loading) {
          _onSelectedHero(hero);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(hero, loading),
          const SizedBox(height: 10),
          _buildName(hero.name!, loading),
        ],
      ),
    );
  }

  Widget _buildLoadingImage() => const LoadingWidget(height: 150);

  Widget _buildImage(HeroModel hero, bool loading) {
    return Hero(
      tag: hero.id!,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        clipBehavior: Clip.hardEdge,
        child: AnimatedSwitcher(
          duration: kThemeAnimationDuration,
          child: loading
              ? _buildLoadingImage()
              : CachedNetworkImage(
                  imageUrl:
                      "${hero.thumbnail!.path}.${hero.thumbnail!.extension}",
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  progressIndicatorBuilder: (_, __, ___) =>
                      _buildLoadingImage(),
                  errorWidget: (_, __, ___) => const Icon(Icons.warning),
                ),
        ),
      ),
    );
  }

  Widget _buildName(String name, bool loading) {
    return AnimatedSwitcher(
      duration: kThemeAnimationDuration,
      child: loading
          ? const LoadingWidget(height: 10)
          : Text(
              name,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }

  void listenerScroll() {
    final marvelvm = context.read<MarvelViewModel>();

    final bool isEnd = _scrollController.position.pixels >=
        (_scrollController.position.maxScrollExtent - 150);
    if (isEnd && !marvelvm.state.loadingMoreData) {
      _currentOffSet += 1;

      marvelvm.fetchMoreHeros(_currentOffSet);
    }
  }

  void _onSelectedHero(HeroModel hero) {
    context.read<MarvelViewModel>().selectedHero(hero);
    Navigator.of(context).pushNamed('/detailHero');
  }
}
