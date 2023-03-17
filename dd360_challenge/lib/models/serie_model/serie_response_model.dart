import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'serie_data_model.dart';

part 'serie_response_model.g.dart';

@JsonSerializable()
class SerieResponseModel {
  const SerieResponseModel({
    this.data = const SerieDataModel(),
  });

  final SerieDataModel? data;

  SerieResponseModel copyWith({
    SerieDataModel? data,
  }) =>
      SerieResponseModel(
        data: data ?? this.data,
      );

  factory SerieResponseModel.fromRawJson(String str) =>
      SerieResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SerieResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SerieResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SerieResponseModelToJson(this);
}
