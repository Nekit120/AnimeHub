import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'get_anime_list_by_filters_query.g.dart';

@JsonSerializable()
class GetAnimeListByFiltersQuery {
  final String token;
  final String types;
  @JsonKey(name: "translation_type")
  final String translationType;
  @JsonKey(name: "anime_genres_and")
  final List<String>? genres;
  @JsonKey(name: "with_episodes")
  final bool withEpisodes;
  @JsonKey(name: "with_material_data")
  final bool withMaterialData;
  @JsonKey(name: "limit")
  final int limit;
  final String? year;
  @JsonKey(name: "shikimori_rating")
  final String? rating;

  const GetAnimeListByFiltersQuery(
      {this.token = "405c66c107c8a27b0064e1506d2ded9f",
      this.types = "anime-serial,anime",
      this.withEpisodes = true,
      this.withMaterialData = true,
      this.translationType = "subtitles",
      this.limit = 20,
      this.genres,
      this.year,
      this.rating});

  factory GetAnimeListByFiltersQuery.fromJson(Map<String, dynamic> json) =>
      _$GetAnimeListByFiltersQueryFromJson(json);

  Map<String, dynamic> toJson() => _$GetAnimeListByFiltersQueryToJson(this);
}
