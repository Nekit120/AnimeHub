import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

import 'anime_api_item.dart';

part 'anime_api_list.g.dart';

@JsonSerializable()
class AnimeApiList {
  String time;
  int total;
  String? prevPage;
  String? nextPage;
  List<AnimeApiItem> results;

  AnimeApiList({
    required this.time,
    required this.total,
    required this.prevPage,
    required this.nextPage,
    required this.results
  });

  factory AnimeApiList.fromJson(Map<String, dynamic> json) =>
      _$AnimeApiListFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeApiListToJson(this);
}
