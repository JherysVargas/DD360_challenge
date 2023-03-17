import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'comic_model.dart';

part 'comic_data_model.g.dart';

@JsonSerializable()
class ComicDataModel {
  const ComicDataModel({
    this.count = 0,
    this.results = const [],
  });

  final int? count;
  final List<ComicModel>? results;

  ComicDataModel copyWith({
    int? count,
    List<ComicModel>? results,
  }) =>
      ComicDataModel(
        count: count ?? this.count,
        results: results ?? this.results,
      );

  factory ComicDataModel.fromRawJson(String str) =>
      ComicDataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ComicDataModel.fromJson(Map<String, dynamic> json) =>
      _$ComicDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComicDataModelToJson(this);
}
