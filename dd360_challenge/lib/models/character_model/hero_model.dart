import 'dart:convert';

import 'package:dd360_challenge/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hero_model.g.dart';

@JsonSerializable()
class HeroModel {
  const HeroModel({
    this.id = 0,
    this.name = '',
    this.description = '',
    this.thumbnail = const ThumbnailModel(),
  });

  final int? id;
  final String? name, description;
  final ThumbnailModel? thumbnail;

  HeroModel copyWith({
    int? id,
    String? name,
    String? description,
    ThumbnailModel? thumbnail,
  }) =>
      HeroModel(
        id: id ?? this.id,
        name: name ?? this.name,
        thumbnail: thumbnail ?? this.thumbnail,
        description: description ?? this.description,
      );

  factory HeroModel.fromRawJson(String str) =>
      HeroModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HeroModel.fromJson(Map<String, dynamic> json) =>
      _$HeroModelFromJson(json);

  Map<String, dynamic> toJson() => _$HeroModelToJson(this);
}
