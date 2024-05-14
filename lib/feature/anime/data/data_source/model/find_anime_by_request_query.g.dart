// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_anime_by_request_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FindAnimeByRequestQuery _$FindAnimeByRequestQueryFromJson(
        Map<String, dynamic> json) =>
    FindAnimeByRequestQuery(
      json['title'] as String,
      token: json['token'] as String? ?? "405c66c107c8a27b0064e1506d2ded9f",
      types: json['types'] as String? ?? "anime-serial,anime",
      withEpisodes: json['with_episodes'] as bool? ?? true,
      withMaterialData: json['with_material_data'] as bool? ?? true,
      limit: (json['limit'] as num?)?.toInt() ?? 30,
      translationType: json['translation_type'] as String? ?? "subtitles",
    );

Map<String, dynamic> _$FindAnimeByRequestQueryToJson(
        FindAnimeByRequestQuery instance) =>
    <String, dynamic>{
      'token': instance.token,
      'types': instance.types,
      'with_episodes': instance.withEpisodes,
      'with_material_data': instance.withMaterialData,
      'translation_type': instance.translationType,
      'limit': instance.limit,
      'title': instance.title,
    };
