// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_api_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeApiList _$AnimeApiListFromJson(Map<String, dynamic> json) => AnimeApiList(
      time: json['time'] as String,
      total: (json['total'] as num).toInt(),
      prevPage: json['prevPage'] as String?,
      nextPage: json['nextPage'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => AnimeApiItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnimeApiListToJson(AnimeApiList instance) =>
    <String, dynamic>{
      'time': instance.time,
      'total': instance.total,
      'prevPage': instance.prevPage,
      'nextPage': instance.nextPage,
      'results': instance.results,
    };
