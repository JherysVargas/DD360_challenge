import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'story_item_model.g.dart';

@JsonSerializable()
class StoryItemModel {
  const StoryItemModel({
    this.name = '',
    this.type = '',
    this.resourceUri = '',
  });

  final String? name, type, resourceUri;

  StoryItemModel copyWith({
    String? resourceUri,
    String? name,
    String? type,
  }) =>
      StoryItemModel(
        resourceUri: resourceUri ?? this.resourceUri,
        name: name ?? this.name,
        type: type ?? this.type,
      );

  factory StoryItemModel.fromRawJson(String str) =>
      StoryItemModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StoryItemModel.fromJson(Map<String, dynamic> json) =>
      _$StoryItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoryItemModelToJson(this);
}
