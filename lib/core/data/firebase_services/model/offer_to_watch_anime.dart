
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'j-son_converter_timestamp.dart';

part 'offer_to_watch_anime.g.dart';

@JsonSerializable()
class OfferToWatchAnime {
  @JsonKey(name: "anime_link")
  final String animeLink;
  @JsonKey(name: "anime_name")
  final String animeName;
  @JsonKey(name: "anime_poster")
  final String animePoster;
  @JsonKey(name: "proposed_id")
  final String proposedId;
  @JsonKey(name: "accepted_id")
  final String? acceptId;
  @JsonKey(name: "is_proposed")
  final bool isProposed;
  @JsonKey(name: "is_accepted")
  final bool isAccepted;
  @TimestampConverter()
  final Timestamp timestamp;




  OfferToWatchAnime( {
    required this.animeLink,
    required this.animeName,
    required this.animePoster,
    required this.proposedId,
    required this.acceptId,
    required this.isProposed,
    required this.isAccepted,
    required this.timestamp
  });

  factory OfferToWatchAnime.fromJson(Map<String, dynamic> json) =>
      _$OfferToWatchAnimeFromJson(json);

  Map<String, dynamic> toJson() => _$OfferToWatchAnimeToJson(this);
}