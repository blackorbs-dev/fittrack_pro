// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Response<D, E extends Error> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Response<D, E>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Response<$D, $E>()';
  }
}

/// @nodoc
class $ResponseCopyWith<D, E extends Error, $Res> {
  $ResponseCopyWith(Response<D, E> _, $Res Function(Response<D, E>) __);
}

/// @nodoc

class SuccessResponse<D, E extends Error> implements Response<D, E> {
  const SuccessResponse(this.data);

  final D data;

  /// Create a copy of Response
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuccessResponseCopyWith<D, E, SuccessResponse<D, E>> get copyWith =>
      _$SuccessResponseCopyWithImpl<D, E, SuccessResponse<D, E>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessResponse<D, E> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'Response<$D, $E>.success(data: $data)';
  }
}

/// @nodoc
abstract mixin class $SuccessResponseCopyWith<D, E extends Error, $Res>
    implements $ResponseCopyWith<D, E, $Res> {
  factory $SuccessResponseCopyWith(SuccessResponse<D, E> value,
          $Res Function(SuccessResponse<D, E>) _then) =
      _$SuccessResponseCopyWithImpl;
  @useResult
  $Res call({D data});
}

/// @nodoc
class _$SuccessResponseCopyWithImpl<D, E extends Error, $Res>
    implements $SuccessResponseCopyWith<D, E, $Res> {
  _$SuccessResponseCopyWithImpl(this._self, this._then);

  final SuccessResponse<D, E> _self;
  final $Res Function(SuccessResponse<D, E>) _then;

  /// Create a copy of Response
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(SuccessResponse<D, E>(
      freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as D,
    ));
  }
}

/// @nodoc

class ErrorResponse<D, E extends Error> implements Response<D, E> {
  const ErrorResponse(this.error);

  final E error;

  /// Create a copy of Response
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorResponseCopyWith<D, E, ErrorResponse<D, E>> get copyWith =>
      _$ErrorResponseCopyWithImpl<D, E, ErrorResponse<D, E>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorResponse<D, E> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @override
  String toString() {
    return 'Response<$D, $E>.error(error: $error)';
  }
}

/// @nodoc
abstract mixin class $ErrorResponseCopyWith<D, E extends Error, $Res>
    implements $ResponseCopyWith<D, E, $Res> {
  factory $ErrorResponseCopyWith(
          ErrorResponse<D, E> value, $Res Function(ErrorResponse<D, E>) _then) =
      _$ErrorResponseCopyWithImpl;
  @useResult
  $Res call({E error});
}

/// @nodoc
class _$ErrorResponseCopyWithImpl<D, E extends Error, $Res>
    implements $ErrorResponseCopyWith<D, E, $Res> {
  _$ErrorResponseCopyWithImpl(this._self, this._then);

  final ErrorResponse<D, E> _self;
  final $Res Function(ErrorResponse<D, E>) _then;

  /// Create a copy of Response
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(ErrorResponse<D, E>(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as E,
    ));
  }
}

// dart format on
