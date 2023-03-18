import 'package:dd360_challenge/models/models.dart';

abstract class HeroInterface {
  Future<CharacterResponseModel> getHeros(int offset);
  Future<ComicResponseModel> getComicsByHero(int idHero);
  Future<EventResponseModel> getEventsByHero(int idHero);
  Future<SerieResponseModel> getSeriesByHero(int idHero);
  Future<StoryResponseModel> getStoriesByHero(int idHero);
}
