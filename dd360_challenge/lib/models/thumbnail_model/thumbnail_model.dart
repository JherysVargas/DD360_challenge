import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'thumbnail_model.g.dart';

@JsonSerializable()
class ThumbnailModel {
  const ThumbnailModel({
    this.path = '',
    this.extension = '',
  });

  final String? path, extension;

  ThumbnailModel copyWith({
    String? path,
    String? extension,
  }) =>
      ThumbnailModel(
        path: path ?? this.path,
        extension: extension ?? this.extension,
      );

  factory ThumbnailModel.fromRawJson(String str) =>
      ThumbnailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ThumbnailModel.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailModelFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbnailModelToJson(this);
}
