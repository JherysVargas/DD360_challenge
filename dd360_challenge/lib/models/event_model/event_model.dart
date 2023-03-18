import 'dart:convert';

import 'package:dd360_challenge/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_model.g.dart';

@JsonSerializable()
class EventModel {
  EventModel({
    this.id = 0,
    this.title = '',
    this.description = '',
    this.resourceUri = '',
    this.urls = const [],
    this.modified = '',
    this.start = '',
    this.end = '',
    this.thumbnail = const ThumbnailModel(),
  });

  final int? id;
  final List<UrlModel>? urls;
  final ThumbnailModel? thumbnail;
  final String? title, description, resourceUri, modified, start, end;

  EventModel copyWith({
    int? id,
    String? title,
    String? description,
    String? resourceUri,
    List<UrlModel>? urls,
    String? modified,
    String? start,
    String? end,
    ThumbnailModel? thumbnail,
  }) =>
      EventModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        resourceUri: resourceUri ?? this.resourceUri,
        urls: urls ?? this.urls,
        modified: modified ?? this.modified,
        start: start ?? this.start,
        end: end ?? this.end,
        thumbnail: thumbnail ?? this.thumbnail,
      );

  factory EventModel.fromRawJson(String str) =>
      EventModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventModelToJson(this);
}
