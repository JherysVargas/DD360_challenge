import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'comics_item_model.dart';

part 'comics_model.g.dart';

@JsonSerializable()
class ComicsModel {
  const ComicsModel({
    this.available = 0,
    this.collectionUri = '',
    this.items = const [],
    this.returned = 0,
  });

  final String? collectionUri;
  final int? available, returned;
  final List<ComicsItemModel>? items;

  ComicsModel copyWith({
    int? available,
    String? collectionUri,
    List<ComicsItemModel>? items,
    int? returned,
  }) =>
      ComicsModel(
        available: available ?? this.available,
        collectionUri: collectionUri ?? this.collectionUri,
        items: items ?? this.items,
        returned: returned ?? this.returned,
      );

  factory ComicsModel.fromRawJson(String str) =>
      ComicsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ComicsModel.fromJson(Map<String, dynamic> json) =>
      _$ComicsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComicsModelToJson(this);
}
