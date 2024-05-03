import 'package:json_annotation/json_annotation.dart';

part 'material_data.g.dart';

@JsonSerializable()
class MaterialData {
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'anime_title')
  final String? titleEn;
  @JsonKey(name: 'anime_kind')
  final String? animeKind;
  @JsonKey(name: 'all_status')
  final String? allStatus;
  @JsonKey(name: 'anime_status')
  final String? animeStatus;
  final String? description;
  @JsonKey(name: 'poster_url')
  final String? posterUrl;
  final int? duration;
  @JsonKey(name: 'all_genres')
  final List<String>? allGenres;
  @JsonKey(name: 'anime_genres')
  final List<String>? animeGenres;
  @JsonKey(name: 'shikimori_rating')
  final double? shikimoriRating;
  @JsonKey(name: 'aired_at')
  final String? airedAt;
  @JsonKey(name: 'episodes_total')
  final int? episodesTotal;
  @JsonKey(name: 'episodes_aired')
  final int? episodesAired;

  MaterialData({
    this.title,
    this.titleEn,
    this.animeKind,
    this.allStatus,
    this.animeStatus,
    this.description,
    this.posterUrl,
    this.duration,
    this.allGenres,
    this.animeGenres,
    this.shikimoriRating,
    this.airedAt,
    this.episodesTotal,
    this.episodesAired,
  });

  factory MaterialData.fromJson(Map<String, dynamic> json) => _$MaterialDataFromJson(json);
  Map<String, dynamic> toJson() => _$MaterialDataToJson(this);
}