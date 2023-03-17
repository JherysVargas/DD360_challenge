part of 'marvel_view_model.dart';

class MarvelState {
  final bool loadingData;
  final bool loadingMoreData;
  final List<HeroModel> data;

  const MarvelState({
    this.loadingData = true,
    this.loadingMoreData = false,
    this.data = const [],
  });

  const MarvelState.empty()
      : loadingData = true,
        loadingMoreData = false,
        data = const [];

  MarvelState copyWith({
    bool? loadingData,
    bool? loadingMoreData,
    List<HeroModel>? data,
  }) =>
      MarvelState(
        data: data ?? this.data,
        loadingData: loadingData ?? this.loadingData,
        loadingMoreData: loadingMoreData ?? this.loadingMoreData,
      );
}
