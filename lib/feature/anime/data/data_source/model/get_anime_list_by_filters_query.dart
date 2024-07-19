import 'package:json_annotation/json_annotation.dart';

part 'get_anime_list_by_filters_query.g.dart';

@JsonSerializable()
class GetAnimeListByFiltersQuery {
  final String token;
  final String types;
  @JsonKey(name: "anime_genres")
  final String genres;
  @JsonKey(name: "with_episodes")
  final bool withEpisodes;
  @JsonKey(name: "with_material_data")
  final bool withMaterialData;
  @JsonKey(name: "limit")
  final int limit;

  const GetAnimeListByFiltersQuery({
    this.token = "405c66c107c8a27b0064e1506d2ded9f",
    required this.genres,
    this.types = "anime-serial,anime",
    this.withEpisodes = true,
    this. withMaterialData = true,
    this.limit = 20,
});
  factory GetAnimeListByFiltersQuery.fromJson(Map<String, dynamic> json) => _$GetAnimeListByFiltersQueryFromJson(json);

  Map<String, dynamic> toJson() => _$GetAnimeListByFiltersQueryToJson(this);


}