// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_to_watch_anime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferToWatchAnime _$OfferToWatchAnimeFromJson(Map<String, dynamic> json) =>
    OfferToWatchAnime(
      animeLink: json['anime_link'] as String,
      animeName: json['anime_name'] as String,
      animePoster: json['anime_poster'] as String,
      proposedId: json['proposed_id'] as String,
      acceptId: json['accepted_id'] as String?,
      isProposed: json['is_proposed'] as bool,
      isAccepted: json['is_accepted'] as bool,
    );

Map<String, dynamic> _$OfferToWatchAnimeToJson(OfferToWatchAnime instance) =>
    <String, dynamic>{
      'anime_link': instance.animeLink,
      'anime_name': instance.animeName,
      'anime_poster': instance.animePoster,
      'proposed_id': instance.proposedId,
      'accepted_id': instance.acceptId,
      'is_proposed': instance.isProposed,
      'is_accepted': instance.isAccepted,
    };
