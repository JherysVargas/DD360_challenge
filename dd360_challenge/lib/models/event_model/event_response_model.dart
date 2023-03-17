import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'event_data_model.dart';

part 'event_response_model.g.dart';

@JsonSerializable()
class EventResponseModel {
  const EventResponseModel({
    this.data = const EventDataModel(),
  });

  final EventDataModel? data;

  EventResponseModel copyWith({
    EventDataModel? data,
  }) =>
      EventResponseModel(
        data: data ?? this.data,
      );

  factory EventResponseModel.fromRawJson(String str) =>
      EventResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EventResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EventResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventResponseModelToJson(this);
}
