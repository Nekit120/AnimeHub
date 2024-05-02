import 'package:anime_hub/feature/anime_board/domain/model/season.dart';
import 'package:json_annotation/json_annotation.dart';

import 'material_data.dart';

part 'anime_api_item.g.dart';

@JsonSerializable()
class AnimeApiItem {
  final String id;
  final String type;
  final String link;
  final String title;
  @JsonKey(name: 'title_orig')
  final String titleOrig;
  final int year;
  final Map<String, Season>? seasons;
  @JsonKey(name: 'material_data')
  final MaterialData? materialData;
  final List<String> screenshots;

  AnimeApiItem({
    required this.id,
    required this.type,
    required this.link,
    required this.title,
    required this.titleOrig,
    required this.year,
    this.seasons,
    this.materialData,
    required this.screenshots,
  });

  factory AnimeApiItem.fromJson(Map<String, dynamic> json) => _$AnimeApiItemFromJson(json);
  Map<String, dynamic> toJson() => _$AnimeApiItemToJson(this);
}