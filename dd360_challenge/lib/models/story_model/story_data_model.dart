import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'story_model.dart';

part 'story_data_model.g.dart';

@JsonSerializable()
class StoryDataModel {
  const StoryDataModel({
    this.count = 0,
    this.results = const [],
  });

  final int? count;
  final List<StoryModel>? results;

  StoryDataModel copyWith({
    int? count,
    List<StoryModel>? results,
  }) =>
      StoryDataModel(
        count: count ?? this.count,
        results: results ?? this.results,
      );

  factory StoryDataModel.fromRawJson(String str) =>
      StoryDataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StoryDataModel.fromJson(Map<String, dynamic> json) =>
      _$StoryDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoryDataModelToJson(this);
}
