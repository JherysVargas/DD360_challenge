import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dd360_challenge/models/models.dart';
import 'package:dd360_challenge/core/view_models/marvel_view_model/marvel_view_model.dart';

import 'render_list_data.dart';

class ListEvents extends StatefulWidget {
  const ListEvents({super.key});

  @override
  State<ListEvents> createState() => _ListEventsState();
}

class _ListEventsState extends State<ListEvents> {
  final ValueNotifier<bool> _loading = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _getComics();
  }

  void _getComics() async {
    _loading.value = true;
    await context.read<MarvelViewModel>().fetchEventsByHero();
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
          },
        ),
      ),
    );
  }

  Widget _buildListData(bool isLoading) {
    return BlocSelector<MarvelViewModel, MarvelState, List<EventModel>>(
      selector: (state) => state.events,
      builder: (context, comics) {
        return RenderListData(
          loading: isLoading,
          data: comics,
          sectionName: 'Eventos',
        );
      },
    );
  }
}
