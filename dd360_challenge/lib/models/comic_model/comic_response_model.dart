import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'comic_data_model.dart';

part 'comic_response_model.g.dart';

@JsonSerializable()
class ComicResponseModel {
  const ComicResponseModel({
    this.data = const ComicDataModel(),
  });

  final ComicDataModel? data;

  ComicResponseModel copyWith({
    ComicDataModel? data,
  }) =>
      ComicResponseModel(
        data: data ?? this.data,
      );

  factory ComicResponseModel.fromRawJson(String str) =>
      ComicResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ComicResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ComicResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComicResponseModelToJson(this);
}
