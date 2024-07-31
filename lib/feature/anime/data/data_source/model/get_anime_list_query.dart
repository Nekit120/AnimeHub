import 'package:json_annotation/json_annotation.dart';

part 'get_anime_list_query.g.dart';

@JsonSerializable()
class GetAnimeListQuery {
  final String token;
  final String types;
  @JsonKey(name: "with_episodes")
  final bool withEpisodes;
  @JsonKey(name: "with_material_data")
  final bool withMaterialData;
  @JsonKey(name: "limit")
  final int limit;

  const  GetAnimeListQuery({
    this.token = "405c66c107c8a27b0064e1506d2ded9f",
    this.types = "anime-serial,anime",
    this.withEpisodes = true,
    this. withMaterialData = true,
    this.limit = 20,
});
  factory GetAnimeListQuery.fromJson(Map<String, dynamic> json) => _$GetAnimeListQueryFromJson(json);

  Map<String, dynamic> toJson() => _$GetAnimeListQueryToJson(this);


}