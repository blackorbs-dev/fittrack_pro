// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DataError {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DataError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DataError()';
  }
}

/// @nodoc
class $DataErrorCopyWith<$Res> {
  $DataErrorCopyWith(DataError _, $Res Function(DataError) __);
}

/// @nodoc

class UnknownError implements DataError {
  const UnknownError();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UnknownError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DataError.unknown()';
  }
}

/// @nodoc

class PlatformError implements DataError {
  const PlatformError({required this.message});

  final String? message;

  /// Create a copy of DataError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlatformErrorCopyWith<PlatformError> get copyWith =>
      _$PlatformErrorCopyWithImpl<PlatformError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlatformError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DataError.platform(message: $message)';
  }
}

/// @nodoc
abstract mixin class $PlatformErrorCopyWith<$Res>
    implements $DataErrorCopyWith<$Res> {
  factory $PlatformErrorCopyWith(
          PlatformError value, $Res Function(PlatformError) _then) =
      _$PlatformErrorCopyWithImpl;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class _$PlatformErrorCopyWithImpl<$Res>
    implements $PlatformErrorCopyWith<$Res> {
  _$PlatformErrorCopyWithImpl(this._self, this._then);

  final PlatformError _self;
  final $Res Function(PlatformError) _then;

  /// Create a copy of DataError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
  }) {
    return _then(PlatformError(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class SerializationError implements DataError {
  const SerializationError();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SerializationError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DataError.serialization()';
  }
}

/// @nodoc

class TimeoutError implements DataError {
  const TimeoutError();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TimeoutError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DataError.timeout()';
  }
}

/// @nodoc

class ErrorMessage implements DataError {
  const ErrorMessage(this.message);

  final String message;

  /// Create a copy of DataError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorMessageCopyWith<ErrorMessage> get copyWith =>
      _$ErrorMessageCopyWithImpl<ErrorMessage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorMessage &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DataError.message(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ErrorMessageCopyWith<$Res>
    implements $DataErrorCopyWith<$Res> {
  factory $ErrorMessageCopyWith(
          ErrorMessage value, $Res Function(ErrorMessage) _then) =
      _$ErrorMessageCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ErrorMessageCopyWithImpl<$Res> implements $ErrorMessageCopyWith<$Res> {
  _$ErrorMessageCopyWithImpl(this._self, this._then);

  final ErrorMessage _self;
  final $Res Function(ErrorMessage) _then;

  /// Create a copy of DataError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ErrorMessage(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
