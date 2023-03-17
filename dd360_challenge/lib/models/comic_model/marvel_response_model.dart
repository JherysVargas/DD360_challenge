import 'dart:convert';

import 'package:dd360_challenge/models/comic_model/data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'marvel_response_model.g.dart';

@JsonSerializable()
class MarvelResponseModel {
  const MarvelResponseModel({
    this.code = 0,
    this.status = '',
    this.copyright = '',
    this.attributionText = '',
    this.attributionHtml = '',
    this.etag = '',
    this.data = const DataModel(),
  });

  final int? code;
  final DataModel? data;
  final String? status, copyright, attributionText, attributionHtml, etag;

  MarvelResponseModel copyWith({
    int? code,
    String? status,
    String? copyright,
    String? attributionText,
    String? attributionHtml,
    String? etag,
    DataModel? data,
  }) =>
      MarvelResponseModel(
        code: code ?? this.code,
        status: status ?? this.status,
        copyright: copyright ?? this.copyright,
        attributionText: attributionText ?? this.attributionText,
        attributionHtml: attributionHtml ?? this.attributionHtml,
        etag: etag ?? this.etag,
        data: data ?? this.data,
      );

  factory MarvelResponseModel.fromRawJson(String str) =>
      MarvelResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MarvelResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MarvelResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MarvelResponseModelToJson(this);
}
