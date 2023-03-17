import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'url_model.dart';
import 'story_model.dart';
import 'comics_model.dart';
import 'thumbnail_model.dart';

part 'hero_model.g.dart';

@JsonSerializable()
class HeroModel {
  HeroModel({
    this.id = 0,
    this.name = '',
    this.description = '',
    this.modified = '',
    this.thumbnail = const ThumbnailModel(),
    this.resourceUri = '',
    this.comics = const ComicsModel(),
    this.series = const ComicsModel(),
    this.stories = const StoryModel(),
    this.events = const ComicsModel(),
    this.urls = const [],
  });

  final int? id;
  final StoryModel? stories;
  final List<UrlModel>? urls;
  final ThumbnailModel? thumbnail;
  final ComicsModel? comics, series, events;
  final String? name, description, modified, resourceUri;

  HeroModel copyWith({
    int? id,
    String? name,
    String? description,
    String? modified,
    ThumbnailModel? thumbnail,
    String? resourceUri,
    ComicsModel? comics,
    ComicsModel? series,
    StoryModel? stories,
    ComicsModel? events,
    List<UrlModel>? urls,
  }) =>
      HeroModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        modified: modified ?? this.modified,
        thumbnail: thumbnail ?? this.thumbnail,
        resourceUri: resourceUri ?? this.resourceUri,
        comics: comics ?? this.comics,
        series: series ?? this.series,
        stories: stories ?? this.stories,
        events: events ?? this.events,
        urls: urls ?? this.urls,
      );

  factory HeroModel.fromRawJson(String str) =>
      HeroModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HeroModel.fromJson(Map<String, dynamic> json) =>
      _$HeroModelFromJson(json);

  Map<String, dynamic> toJson() => _$HeroModelToJson(this);
}
