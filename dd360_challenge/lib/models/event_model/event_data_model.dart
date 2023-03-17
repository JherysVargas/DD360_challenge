import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'event_model.dart';

part 'event_data_model.g.dart';

@JsonSerializable()
class EventDataModel {
  const EventDataModel({
    this.count = 0,
    this.results = const [],
  });

  final int? count;
  final List<EventModel>? results;

  EventDataModel copyWith({
    int? count,
    List<EventModel>? results,
  }) =>
      EventDataModel(
        count: count ?? this.count,
        results: results ?? this.results,
      );

  factory EventDataModel.fromRawJson(String str) =>
      EventDataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EventDataModel.fromJson(Map<String, dynamic> json) =>
      _$EventDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventDataModelToJson(this);
}
