import 'package:json_annotation/json_annotation.dart';

part 'find_anime_by_request_query.g.dart';

@JsonSerializable()
class FindAnimeByRequestQuery {
  final String token;
  final String types;
  @JsonKey(name: "with_episodes")
  final bool withEpisodes ;
  @JsonKey(name: "with_material_data")
  final bool withMaterialData ;
  @JsonKey(name: "translation_type")
  final String translationType;
  final int limit;
  final String title;

   const FindAnimeByRequestQuery(this.title, {
    this.token = "405c66c107c8a27b0064e1506d2ded9f",
    this.types = "anime-serial,anime",
    this.withEpisodes = true,
    this. withMaterialData = true,
    this.limit = 30,
    this.translationType = "subtitles",
  });

  factory FindAnimeByRequestQuery.fromJson(Map<String, dynamic> json) => _$FindAnimeByRequestQueryFromJson(json);

  Map<String, dynamic> toJson() => _$FindAnimeByRequestQueryToJson(this);


}