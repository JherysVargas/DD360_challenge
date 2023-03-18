import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dd360_challenge/models/models.dart';
import 'package:dd360_challenge/core/view_models/marvel_view_model/marvel_view_model.dart';

import 'render_list_data.dart';

class ListComics extends StatefulWidget {
  const ListComics({super.key});

  @override
  State<ListComics> createState() => _ListComicsState();
}

class _ListComicsState extends State<ListComics> {
  final ValueNotifier<bool> _loading = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _getComics();
  }

  void _getComics() async {
    _loading.value = true;
    await context.read<MarvelViewModel>().fetchComicsByHero();
    _loading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ValueListenableBuilder<bool>(
          valueListenable: _loading,
          builder: (BuildContext _, bool isLoading, Widget? __) {
            return _buildListData(isLoading);
          }),
    );
  }

  Widget _buildListData(bool isLoading) {
    return BlocSelector<MarvelViewModel, MarvelState, List<ComicModel>>(
      selector: (state) => state.comics,
      builder: (context, comics) {
        return RenderListData(
          loading: isLoading,
          data: comics,
          sectionName: 'Comics',
        );
      },
    );
  }
}
