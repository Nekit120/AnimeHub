import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/domain/model/anime_api_item.dart';
import '../../../../../core/domain/model/anime_api_list.dart';
import '../../../../../core/domain/use_case_result/use_case_result.dart';

part 'anime_search_state.freezed.dart';

@freezed
class AnimeSearchState with _$AnimeSearchState {
  const factory AnimeSearchState({
    Result<AnimeApiList>? result,
    required bool loading,
  }) = _AnimeSearchState;
}