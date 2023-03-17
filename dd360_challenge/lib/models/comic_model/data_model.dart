import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'hero_model.dart';

part 'data_model.g.dart';

@JsonSerializable()
class DataModel {
  const DataModel({
    this.offset = 0,
    this.limit = 0,
    this.total = 0,
    this.count = 0,
    this.results = const [],
  });

  final List<HeroModel>? results;
  final int? offset, limit, total, count;

  DataModel copyWith({
    int? offset,
    int? limit,
    int? total,
    int? count,
    List<HeroModel>? results,
  }) =>
      DataModel(
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
        total: total ?? this.total,
        count: count ?? this.count,
        results: results ?? this.results,
      );

  factory DataModel.fromRawJson(String str) =>
      DataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}
