// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_search_favorite_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnimeSearchFavoriteState {
  Result<List<AnimeApiItem>>? get result => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimeSearchFavoriteStateCopyWith<AnimeSearchFavoriteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeSearchFavoriteStateCopyWith<$Res> {
  factory $AnimeSearchFavoriteStateCopyWith(AnimeSearchFavoriteState value,
          $Res Function(AnimeSearchFavoriteState) then) =
      _$AnimeSearchFavoriteStateCopyWithImpl<$Res, AnimeSearchFavoriteState>;
  @useResult
  $Res call({Result<List<AnimeApiItem>>? result, bool loading});
}

/// @nodoc
class _$AnimeSearchFavoriteStateCopyWithImpl<$Res,
        $Val extends AnimeSearchFavoriteState>
    implements $AnimeSearchFavoriteStateCopyWith<$Res> {
  _$AnimeSearchFavoriteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
    Object? loading = null,
  }) {
    return _then(_value.copyWith(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Result<List<AnimeApiItem>>?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnimeSearchFavoriteStateImplCopyWith<$Res>
    implements $AnimeSearchFavoriteStateCopyWith<$Res> {
  factory _$$AnimeSearchFavoriteStateImplCopyWith(
          _$AnimeSearchFavoriteStateImpl value,
          $Res Function(_$AnimeSearchFavoriteStateImpl) then) =
      __$$AnimeSearchFavoriteStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Result<List<AnimeApiItem>>? result, bool loading});
}

/// @nodoc
class __$$AnimeSearchFavoriteStateImplCopyWithImpl<$Res>
    extends _$AnimeSearchFavoriteStateCopyWithImpl<$Res,
        _$AnimeSearchFavoriteStateImpl>
    implements _$$AnimeSearchFavoriteStateImplCopyWith<$Res> {
  __$$AnimeSearchFavoriteStateImplCopyWithImpl(
      _$AnimeSearchFavoriteStateImpl _value,
      $Res Function(_$AnimeSearchFavoriteStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
    Object? loading = null,
  }) {
    return _then(_$AnimeSearchFavoriteStateImpl(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Result<List<AnimeApiItem>>?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AnimeSearchFavoriteStateImpl implements _AnimeSearchFavoriteState {
  const _$AnimeSearchFavoriteStateImpl({this.result, required this.loading});

  @override
  final Result<List<AnimeApiItem>>? result;
  @override
  final bool loading;

  @override
  String toString() {
    return 'AnimeSearchFavoriteState(result: $result, loading: $loading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeSearchFavoriteStateImpl &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result, loading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeSearchFavoriteStateImplCopyWith<_$AnimeSearchFavoriteStateImpl>
      get copyWith => __$$AnimeSearchFavoriteStateImplCopyWithImpl<
          _$AnimeSearchFavoriteStateImpl>(this, _$identity);
}

abstract class _AnimeSearchFavoriteState implements AnimeSearchFavoriteState {
  const factory _AnimeSearchFavoriteState(
      {final Result<List<AnimeApiItem>>? result,
      required final bool loading}) = _$AnimeSearchFavoriteStateImpl;

  @override
  Result<List<AnimeApiItem>>? get result;
  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  _$$AnimeSearchFavoriteStateImplCopyWith<_$AnimeSearchFavoriteStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
