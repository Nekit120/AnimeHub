import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/domain/model/anime_api_item.dart';
import '../../../../../core/domain/use_case_result/use_case_result.dart';

part 'anime_search_favorite_state.freezed.dart';

@freezed
class AnimeSearchFavoriteState with _$AnimeSearchFavoriteState {
  const factory AnimeSearchFavoriteState({
    Result<List<AnimeApiItem>>? result,
    required bool loading,
  }) = _AnimeSearchFavoriteState;
}