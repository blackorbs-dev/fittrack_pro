// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DashboardState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DashboardState()';
  }
}

/// @nodoc
class $DashboardStateCopyWith<$Res> {
  $DashboardStateCopyWith(DashboardState _, $Res Function(DashboardState) __);
}

/// @nodoc

class Initial implements DashboardState {
  const Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DashboardState.initial()';
  }
}

/// @nodoc

class Loaded implements DashboardState {
  const Loaded(
      {required this.workoutStats,
      required this.selectedChart,
      this.errorMessage});

  final WorkoutStats workoutStats;
  final ChartType selectedChart;
  final String? errorMessage;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadedCopyWith<Loaded> get copyWith =>
      _$LoadedCopyWithImpl<Loaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Loaded &&
            (identical(other.workoutStats, workoutStats) ||
                other.workoutStats == workoutStats) &&
            (identical(other.selectedChart, selectedChart) ||
                other.selectedChart == selectedChart) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, workoutStats, selectedChart, errorMessage);

  @override
  String toString() {
    return 'DashboardState.loaded(workoutStats: $workoutStats, selectedChart: $selectedChart, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) =
      _$LoadedCopyWithImpl;
  @useResult
  $Res call(
      {WorkoutStats workoutStats,
      ChartType selectedChart,
      String? errorMessage});

  $WorkoutStatsCopyWith<$Res> get workoutStats;
}

/// @nodoc
class _$LoadedCopyWithImpl<$Res> implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workoutStats = null,
    Object? selectedChart = null,
    Object? errorMessage = freezed,
  }) {
    return _then(Loaded(
      workoutStats: null == workoutStats
          ? _self.workoutStats
          : workoutStats // ignore: cast_nullable_to_non_nullable
              as WorkoutStats,
      selectedChart: null == selectedChart
          ? _self.selectedChart
          : selectedChart // ignore: cast_nullable_to_non_nullable
              as ChartType,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkoutStatsCopyWith<$Res> get workoutStats {
    return $WorkoutStatsCopyWith<$Res>(_self.workoutStats, (value) {
      return _then(_self.copyWith(workoutStats: value));
    });
  }
}

// dart format on
