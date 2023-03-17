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
}
