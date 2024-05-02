// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialData _$MaterialDataFromJson(Map<String, dynamic> json) => MaterialData(
      titleEn: json['anime_title'] as String?,
      animeKind: json['anime_kind'] as String?,
      allStatus: json['all_status'] as String?,
      animeStatus: json['anime_status'] as String?,
      description: json['description'] as String?,
      posterUrl: json['poster_url'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      allGenres: (json['all_genres'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      animeGenres: (json['anime_genres'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      shikimoriRating: (json['shikimori_rating'] as num?)?.toDouble(),
      airedAt: json['aired_at'] as String?,
      episodesTotal: (json['episodes_total'] as num?)?.toInt(),
      episodesAired: (json['episodes_aired'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MaterialDataToJson(MaterialData instance) =>
    <String, dynamic>{
      'anime_title': instance.titleEn,
      'anime_kind': instance.animeKind,
      'all_status': instance.allStatus,
      'anime_status': instance.animeStatus,
      'description': instance.description,
      'poster_url': instance.posterUrl,
      'duration': instance.duration,
      'all_genres': instance.allGenres,
      'anime_genres': instance.animeGenres,
      'shikimori_rating': instance.shikimoriRating,
      'aired_at': instance.airedAt,
      'episodes_total': instance.episodesTotal,
      'episodes_aired': instance.episodesAired,
    };
