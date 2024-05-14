// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnimeSearchState {
  Result<AnimeApiList>? get result => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimeSearchStateCopyWith<AnimeSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeSearchStateCopyWith<$Res> {
  factory $AnimeSearchStateCopyWith(
          AnimeSearchState value, $Res Function(AnimeSearchState) then) =
      _$AnimeSearchStateCopyWithImpl<$Res, AnimeSearchState>;
  @useResult
  $Res call({Result<AnimeApiList>? result, bool loading});
}

/// @nodoc
class _$AnimeSearchStateCopyWithImpl<$Res, $Val extends AnimeSearchState>
    implements $AnimeSearchStateCopyWith<$Res> {
  _$AnimeSearchStateCopyWithImpl(this._value, this._then);

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
              as Result<AnimeApiList>?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnimeSearchStateImplCopyWith<$Res>
    implements $AnimeSearchStateCopyWith<$Res> {
  factory _$$AnimeSearchStateImplCopyWith(_$AnimeSearchStateImpl value,
          $Res Function(_$AnimeSearchStateImpl) then) =
      __$$AnimeSearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Result<AnimeApiList>? result, bool loading});
}

/// @nodoc
class __$$AnimeSearchStateImplCopyWithImpl<$Res>
    extends _$AnimeSearchStateCopyWithImpl<$Res, _$AnimeSearchStateImpl>
    implements _$$AnimeSearchStateImplCopyWith<$Res> {
  __$$AnimeSearchStateImplCopyWithImpl(_$AnimeSearchStateImpl _value,
      $Res Function(_$AnimeSearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
    Object? loading = null,
  }) {
    return _then(_$AnimeSearchStateImpl(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Result<AnimeApiList>?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AnimeSearchStateImpl implements _AnimeSearchState {
  const _$AnimeSearchStateImpl({this.result, required this.loading});

  @override
  final Result<AnimeApiList>? result;
  @override
  final bool loading;

  @override
  String toString() {
    return 'AnimeSearchState(result: $result, loading: $loading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeSearchStateImpl &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result, loading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeSearchStateImplCopyWith<_$AnimeSearchStateImpl> get copyWith =>
      __$$AnimeSearchStateImplCopyWithImpl<_$AnimeSearchStateImpl>(
          this, _$identity);
}

abstract class _AnimeSearchState implements AnimeSearchState {
  const factory _AnimeSearchState(
      {final Result<AnimeApiList>? result,
      required final bool loading}) = _$AnimeSearchStateImpl;

  @override
  Result<AnimeApiList>? get result;
  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  _$$AnimeSearchStateImplCopyWith<_$AnimeSearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
