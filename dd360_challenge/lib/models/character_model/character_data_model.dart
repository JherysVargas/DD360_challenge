import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'hero_model.dart';

part 'character_data_model.g.dart';

@JsonSerializable()
class CharacterDataModel {
  const CharacterDataModel({
    this.count = 0,
    this.results = const [],
  });

  final int? count;
  final List<HeroModel>? results;

  CharacterDataModel copyWith({
    int? count,
    List<HeroModel>? results,
  }) =>
      CharacterDataModel(
        count: count ?? this.count,
        results: results ?? this.results,
      );

  factory CharacterDataModel.fromRawJson(String str) =>
      CharacterDataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CharacterDataModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterDataModelToJson(this);
}
