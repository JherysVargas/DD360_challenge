part of 'marvel_view_model.dart';

class MarvelState {
  final bool loadingData;
  final bool loadingMoreData;
  final List<HeroModel> data;
  final List<ComicModel> comics;
  final List<EventModel> events;
  final List<SerieModel> series;
  final List<StoryModel> stories;
  final HeroModel selectedHero;

  const MarvelState({
    this.loadingData = true,
    this.loadingMoreData = false,
    this.selectedHero = const HeroModel(),
    this.data = const [],
    this.comics = const [],
    this.events = const [],
    this.series = const [],
    this.stories = const [],
  });

  const MarvelState.empty()
      : loadingData = true,
        loadingMoreData = false,
        selectedHero = const HeroModel(),
        data = const [],
        comics = const [],
        events = const [],
        series = const [],
        stories = const [];

  MarvelState copyWith({
    bool? loadingData,
    bool? loadingMoreData,
    List<HeroModel>? data,
    HeroModel? selectedHero,
    List<ComicModel>? comics,
    List<EventModel>? events,
    List<SerieModel>? series,
    List<StoryModel>? stories,
  }) =>
      MarvelState(
        data: data ?? this.data,
        comics: comics ?? this.comics,
        events: events ?? this.events,
        series: series ?? this.series,
        stories: stories ?? this.stories,
        loadingData: loadingData ?? this.loadingData,
        selectedHero: selectedHero ?? this.selectedHero,
        loadingMoreData: loadingMoreData ?? this.loadingMoreData,
      );
}
