// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_api_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeApiItem _$AnimeApiItemFromJson(Map<String, dynamic> json) => AnimeApiItem(
      id: json['id'] as String,
      type: json['type'] as String,
      link: json['link'] as String,
      title: json['title'] as String,
      titleOrig: json['title_orig'] as String,
      year: (json['year'] as num).toInt(),
      seasons: (json['seasons'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Season.fromJson(e as Map<String, dynamic>)),
      ),
      materialData: json['material_data'] == null
          ? null
          : MaterialData.fromJson(
              json['material_data'] as Map<String, dynamic>),
      screenshots: (json['screenshots'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AnimeApiItemToJson(AnimeApiItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'link': instance.link,
      'title': instance.title,
      'title_orig': instance.titleOrig,
      'year': instance.year,
      'seasons': instance.seasons,
      'material_data': instance.materialData,
      'screenshots': instance.screenshots,
    };
