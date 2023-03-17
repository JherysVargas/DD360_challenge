import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:dd360_challenge/models/models.dart';
import 'package:dd360_challenge/core/utils/http_provider.dart';

import 'hero_interface.dart';

@injectable
class HeroInterfaceImpl implements HeroInterface {
  final HttpBaseProvider _httpBaseProvider;

  HeroInterfaceImpl(this._httpBaseProvider);

  @override
  Future<CharacterResponseModel> getHeros(int offset) async {
    final Response response = await _httpBaseProvider.get(
      '/characters',
      queryParameters: {"offset": offset},
    );

    if (response.statusCode == 200 && response.data != null) {
      return CharacterResponseModel.fromJson(response.data);
    }
    return const CharacterResponseModel();
  }

  @override
  Future<CharacterResponseModel> getDetailHero(int idHero) async {
    final Response response = await _httpBaseProvider.get(
      '/characters/$idHero',
    );

    if (response.statusCode == 200 && response.data != null) {
      return CharacterResponseModel.fromJson(response.data);
    }
    return const CharacterResponseModel();
  }

  @override
  Future<ComicResponseModel> getComitsByHero(int idHero) async {
    final Response response = await _httpBaseProvider.get(
      '/characters/$idHero/comics',
    );

    if (response.statusCode == 200 && response.data != null) {
      return ComicResponseModel.fromJson(response.data);
    }
    return const ComicResponseModel();
  }

  @override
  Future<EventResponseModel> getEventsByHero(int idHero) async {
    final Response response = await _httpBaseProvider.get(
      '/characters/$idHero/events',
    );

    if (response.statusCode == 200 && response.data != null) {
      return EventResponseModel.fromJson(response.data);
    }
    return const EventResponseModel();
  }

  @override
  Future<SerieResponseModel> getSeriesByHero(int idHero) async {
    final Response response = await _httpBaseProvider.get(
      '/characters/$idHero/series',
    );

    if (response.statusCode == 200 && response.data != null) {
      return SerieResponseModel.fromJson(response.data);
    }
    return const SerieResponseModel();
  }

  @override
  Future<StoryResponseModel> getStoriesByHero(int idHero) async {
    final Response response = await _httpBaseProvider.get(
      '/characters/$idHero/stories',
    );

    if (response.statusCode == 200 && response.data != null) {
      return StoryResponseModel.fromJson(response.data);
    }
    return const StoryResponseModel();
  }
}
