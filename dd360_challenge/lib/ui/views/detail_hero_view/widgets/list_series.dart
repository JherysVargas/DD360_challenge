import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dd360_challenge/models/models.dart';
import 'package:dd360_challenge/core/view_models/marvel_view_model/marvel_view_model.dart';

import 'render_list_data.dart';

class ListSeries extends StatefulWidget {
  const ListSeries({super.key});

  @override
  State<ListSeries> createState() => _ListSeriesState();
}

class _ListSeriesState extends State<ListSeries> {
  final ValueNotifier<bool> _loading = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _getComics();
  }

  void _getComics() async {
    _loading.value = true;
    await context.read<MarvelViewModel>().fetchSeriesByHero();
    _loading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 16),
      sliver: SliverToBoxAdapter(
        child: ValueListenableBuilder<bool>(
            valueListenable: _loading,
            builder: (BuildContext _, bool isLoading, Widget? __) {
              return _buildListData(isLoading);
            }),
      ),
    );
  }

  Widget _buildListData(bool isLoading) {
    return BlocSelector<MarvelViewModel, MarvelState, List<SerieModel>>(
      selector: (state) => state.series,
      builder: (context, comics) {
        return RenderListData(
          loading: isLoading,
          data: comics,
          sectionName: 'Series',
        );
      },
    );
  }
}
