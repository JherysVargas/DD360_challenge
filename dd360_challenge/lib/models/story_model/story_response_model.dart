import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'story_data_model.dart';

part 'story_response_model.g.dart';

@JsonSerializable()
class StoryResponseModel {
  const StoryResponseModel({
    this.data = const StoryDataModel(),
  });

  final StoryDataModel? data;

  StoryResponseModel copyWith({
    StoryDataModel? data,
  }) =>
      StoryResponseModel(
        data: data ?? this.data,
      );

  factory StoryResponseModel.fromRawJson(String str) =>
      StoryResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StoryResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoryResponseModelToJson(this);
}
