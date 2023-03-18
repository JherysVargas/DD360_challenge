import 'dart:convert';

import 'package:dd360_challenge/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'serie_model.g.dart';

@JsonSerializable()
class SerieModel {
  SerieModel({
    this.id = 0,
    this.title = '',
    this.description = '',
    this.resourceUri = '',
    this.urls = const [],
    this.rating = '',
    this.modified = '',
    this.thumbnail = const ThumbnailModel(),
  });

  final int? id;
  final List<UrlModel>? urls;
  final ThumbnailModel? thumbnail;
  final String? title, description, resourceUri, rating, modified;

  SerieModel copyWith({
    int? id,
    String? title,
    String? description,
    String? resourceUri,
    List<UrlModel>? urls,
    String? rating,
    String? modified,
    ThumbnailModel? thumbnail,
  }) =>
      SerieModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        resourceUri: resourceUri ?? this.resourceUri,
        urls: urls ?? this.urls,
        rating: rating ?? this.rating,
        modified: modified ?? this.modified,
        thumbnail: thumbnail ?? this.thumbnail,
      );

  factory SerieModel.fromRawJson(String str) =>
      SerieModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SerieModel.fromJson(Map<String, dynamic> json) =>
      _$SerieModelFromJson(json);

  Map<String, dynamic> toJson() => _$SerieModelToJson(this);
}
