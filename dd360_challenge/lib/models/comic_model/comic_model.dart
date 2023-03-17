import 'dart:convert';

import 'package:dd360_challenge/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comic_model.g.dart';

@JsonSerializable()
class ComicModel {
  ComicModel({
    this.id = 0,
    this.digitalId = 0,
    this.title = '',
    this.variantDescription = '',
    this.description = '',
    this.format = '',
    this.thumbnail = const ThumbnailModel(),
    this.images = const [],
  });

  final int? id;
  final int? digitalId;
  final String? title;
  final String? variantDescription;
  final String? description;
  final String? format;
  final ThumbnailModel? thumbnail;
  final List<ThumbnailModel>? images;

  ComicModel copyWith({
    int? id,
    int? digitalId,
    String? title,
    String? variantDescription,
    String? description,
    String? format,
    ThumbnailModel? thumbnail,
    List<ThumbnailModel>? images,
  }) =>
      ComicModel(
        id: id ?? this.id,
        digitalId: digitalId ?? this.digitalId,
        title: title ?? this.title,
        variantDescription: variantDescription ?? this.variantDescription,
        description: description ?? this.description,
        format: format ?? this.format,
        thumbnail: thumbnail ?? this.thumbnail,
        images: images ?? this.images,
      );

  factory ComicModel.fromRawJson(String str) =>
      ComicModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ComicModel.fromJson(Map<String, dynamic> json) =>
      _$ComicModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComicModelToJson(this);
}
