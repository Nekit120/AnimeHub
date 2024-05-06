// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Season _$SeasonFromJson(Map<String, dynamic> json) => Season(
      link: json['link'] as String,
      episodes: Map<String, String>.from(json['episodes'] as Map),
    );

Map<String, dynamic> _$SeasonToJson(Season instance) => <String, dynamic>{
      'link': instance.link,
      'episodes': instance.episodes,
    };
