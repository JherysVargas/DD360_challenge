part of 'marvel_view_model.dart';

class MarvelState {
  final bool loadingData;
  final bool loadingMoreData;
  final bool loadingDataDetail;
  final List<HeroModel> data;
  final HeroModel selectedHero;

  const MarvelState({
    this.loadingData = true,
    this.loadingDataDetail = true,
    this.loadingMoreData = false,
    this.selectedHero = const HeroModel(),
    this.data = const [],
  });

  const MarvelState.empty()
      : loadingData = true,
        loadingDataDetail = true,
        loadingMoreData = false,
        selectedHero = const HeroModel(),
        data = const [];

  MarvelState copyWith({
    bool? loadingData,
    bool? loadingMoreData,
    bool? loadingDataDetail,
    List<HeroModel>? data,
    HeroModel? selectedHero,
  }) =>
      MarvelState(
        data: data ?? this.data,
        loadingData: loadingData ?? this.loadingData,
        selectedHero: selectedHero ?? this.selectedHero,
        loadingMoreData: loadingMoreData ?? this.loadingMoreData,
        loadingDataDetail: loadingDataDetail ?? this.loadingDataDetail,
      );
}
