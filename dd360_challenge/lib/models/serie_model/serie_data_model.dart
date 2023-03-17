import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'serie_model.dart';

part 'serie_data_model.g.dart';

@JsonSerializable()
class SerieDataModel {
  const SerieDataModel({
    this.count = 0,
    this.results = const [],
  });

  final int? count;
  final List<SerieModel>? results;

  SerieDataModel copyWith({
    int? count,
    List<SerieModel>? results,
  }) =>
      SerieDataModel(
        count: count ?? this.count,
        results: results ?? this.results,
      );

  factory SerieDataModel.fromRawJson(String str) =>
      SerieDataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SerieDataModel.fromJson(Map<String, dynamic> json) =>
      _$SerieDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$SerieDataModelToJson(this);
}
