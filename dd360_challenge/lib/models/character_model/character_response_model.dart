import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'character_data_model.dart';

part 'character_response_model.g.dart';

@JsonSerializable()
class CharacterResponseModel {
  const CharacterResponseModel({
    this.data = const CharacterDataModel(),
  });

  final CharacterDataModel? data;

  CharacterResponseModel copyWith({
    CharacterDataModel? data,
  }) =>
      CharacterResponseModel(
        data: data ?? this.data,
      );

  factory CharacterResponseModel.fromRawJson(String str) =>
      CharacterResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CharacterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterResponseModelToJson(this);
}
