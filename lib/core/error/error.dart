import 'package:freezed_annotation/freezed_annotation.dart';

part 'error.freezed.dart';

abstract class Error{}

@freezed
sealed class DataError with _$DataError implements Error {
  const factory DataError.unknown() = UnknownError;
  const factory DataError.platform({required String? message}) = PlatformError;
  const factory DataError.serialization() = SerializationError;
  const factory DataError.timeout() = TimeoutError;
  const factory DataError.message(String message) = ErrorMessage;
}