// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_anime_list_by_filters_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAnimeListByFiltersQuery _$GetAnimeListByFiltersQueryFromJson(
        Map<String, dynamic> json) =>
    GetAnimeListByFiltersQuery(
      token: json['token'] as String? ?? "405c66c107c8a27b0064e1506d2ded9f",
      genres: json['anime_genres'] as String,
      types: json['types'] as String? ?? "anime-serial,anime",
      withEpisodes: json['with_episodes'] as bool? ?? true,
      withMaterialData: json['with_material_data'] as bool? ?? true,
      limit: (json['limit'] as num?)?.toInt() ?? 20,
    );

Map<String, dynamic> _$GetAnimeListByFiltersQueryToJson(
        GetAnimeListByFiltersQuery instance) =>
    <String, dynamic>{
      'token': instance.token,
      'types': instance.types,
      'anime_genres': instance.genres,
      'with_episodes': instance.withEpisodes,
      'with_material_data': instance.withMaterialData,
      'limit': instance.limit,
    };
