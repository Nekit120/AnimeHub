// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_anime_list_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAnimeListQuery _$GetAnimeListQueryFromJson(Map<String, dynamic> json) =>
    GetAnimeListQuery(
      token: json['token'] as String? ?? "405c66c107c8a27b0064e1506d2ded9f",
      types: json['types'] as String? ?? "anime-serial,anime",
      withEpisodes: json['with_episodes'] as bool? ?? true,
      withMaterialData: json['with_material_data'] as bool? ?? true,
      limit: (json['limit'] as num?)?.toInt() ?? 20,
    );

Map<String, dynamic> _$GetAnimeListQueryToJson(GetAnimeListQuery instance) =>
    <String, dynamic>{
      'token': instance.token,
      'types': instance.types,
      'with_episodes': instance.withEpisodes,
      'with_material_data': instance.withMaterialData,
      'limit': instance.limit,
    };
