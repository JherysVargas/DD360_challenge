import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'story_item_model.dart';

part 'story_model.g.dart';

@JsonSerializable()
class StoryModel {
  const StoryModel({
    this.available = 0,
    this.collectionUri = '',
    this.items = const [],
    this.returned = 0,
  });

  final String? collectionUri;
  final int? available, returned;
  final List<StoryItemModel>? items;

  StoryModel copyWith({
    int? available,
    String? collectionUri,
    List<StoryItemModel>? items,
    int? returned,
  }) =>
      StoryModel(
        available: available ?? this.available,
        collectionUri: collectionUri ?? this.collectionUri,
        items: items ?? this.items,
        returned: returned ?? this.returned,
      );

  factory StoryModel.fromRawJson(String str) =>
      StoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StoryModel.fromJson(Map<String, dynamic> json) =>
      _$StoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoryModelToJson(this);
}
