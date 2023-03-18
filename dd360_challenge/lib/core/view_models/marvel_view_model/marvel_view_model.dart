import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dd360_challenge/models/models.dart';
import 'package:dd360_challenge/core/repositories/hero_repository/hero_impl.dart';

part 'marvel_state.dart';

class MarvelViewModel extends Cubit<MarvelState> {
  MarvelViewModel(
    this._heroInterfaceImpl,
  ) : super(const MarvelState());

  final HeroInterfaceImpl _heroInterfaceImpl;

  void fetchHeros(int offset) async {
    emit(state.copyWith(loadingData: true));

    final CharacterResponseModel response = await _heroInterfaceImpl.getHeros(
      offset,
    );

    emit(state.copyWith(data: response.data!.results, loadingData: false));
  }

  void fetchMoreHeros(int offset) async {
    emit(state.copyWith(loadingMoreData: true));

    final CharacterResponseModel response = await _heroInterfaceImpl.getHeros(
      offset,
    );

    if (response.data!.count != 0) {
      emit(state.copyWith(
        data: [...state.data, ...response.data!.results!],
        loadingMoreData: false,
      ));
      return;
    }

    emit(state.copyWith(loadingMoreData: false));
  }

  void selectedHero(HeroModel hero) {
    emit(state.copyWith(selectedHero: hero));
  }

  Future<void> fetchComicsByHero() async {
    final ComicResponseModel response =
        await _heroInterfaceImpl.getComicsByHero(
      state.selectedHero.id!,
    );

    if (response.data!.results!.isNotEmpty) {
      emit(state.copyWith(comics: response.data!.results!));
    }
  }

  Future<void> fetchEventsByHero() async {
    final EventResponseModel response =
        await _heroInterfaceImpl.getEventsByHero(
      state.selectedHero.id!,
    );

    if (response.data!.results!.isNotEmpty) {
      emit(state.copyWith(events: response.data!.results!));
    }
  }

  Future<void> fetchSeriesByHero() async {
    final SerieResponseModel response =
        await _heroInterfaceImpl.getSeriesByHero(
      state.selectedHero.id!,
    );

    if (response.data!.results!.isNotEmpty) {
      emit(state.copyWith(series: response.data!.results!));
    }
  }

  Future<void> fetchStoriesByHero() async {
    final StoryResponseModel response =
        await _heroInterfaceImpl.getStoriesByHero(
      state.selectedHero.id!,
    );

    if (response.data!.results!.isNotEmpty) {
      emit(state.copyWith(stories: response.data!.results!));
    }
  }
}
