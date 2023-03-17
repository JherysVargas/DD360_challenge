import 'dart:convert';

import 'package:dd360_challenge/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'story_model.g.dart';

@JsonSerializable()
class StoryModel {
  StoryModel({
    this.id = '',
    this.title = '',
    this.description = '',
    this.resourceUri = '',
    this.type = '',
    this.modified = '',
    this.thumbnail = const ThumbnailModel(),
  });

  final ThumbnailModel? thumbnail;
  final String? id, title, description, resourceUri, type, modified;

  StoryModel copyWith({
    String? id,
    String? title,
    String? description,
    String? resourceUri,
    String? type,
    String? modified,
    ThumbnailModel? thumbnail,
  }) =>
      StoryModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        resourceUri: resourceUri ?? this.resourceUri,
        type: type ?? this.type,
        modified: modified ?? this.modified,
        thumbnail: thumbnail ?? this.thumbnail,
      );

  factory StoryModel.fromRawJson(String str) =>
      StoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StoryModel.fromJson(Map<String, dynamic> json) =>
      _$StoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoryModelToJson(this);
}
