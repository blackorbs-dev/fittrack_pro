import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_point.freezed.dart';

@freezed
abstract class DataPoint with _$DataPoint {
  const factory DataPoint({
    required DateTime time,
    required int value,
  }) = _DataPoint;

}