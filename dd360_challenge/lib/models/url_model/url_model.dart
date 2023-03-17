import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'url_model.g.dart';

@JsonSerializable()
class UrlModel {
  const UrlModel({
    this.type = '',
    this.url = '',
  });

  final String? type, url;

  UrlModel copyWith({
    String? type,
    String? url,
  }) =>
      UrlModel(
        type: type ?? this.type,
        url: url ?? this.url,
      );

  factory UrlModel.fromRawJson(String str) =>
      UrlModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UrlModel.fromJson(Map<String, dynamic> json) =>
      _$UrlModelFromJson(json);

  Map<String, dynamic> toJson() => _$UrlModelToJson(this);
}
