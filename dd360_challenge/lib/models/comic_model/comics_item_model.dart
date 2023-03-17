import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'comics_item_model.g.dart';

@JsonSerializable()
class ComicsItemModel {
  const ComicsItemModel({
    this.name = '',
    this.resourceUri = '',
  });

  final String? name, resourceUri;

  ComicsItemModel copyWith({
    String? name,
    String? resourceUri,
  }) =>
      ComicsItemModel(
        resourceUri: resourceUri ?? this.resourceUri,
        name: name ?? this.name,
      );

  factory ComicsItemModel.fromRawJson(String str) =>
      ComicsItemModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ComicsItemModel.fromJson(Map<String, dynamic> json) =>
      _$ComicsItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComicsItemModelToJson(this);
}
