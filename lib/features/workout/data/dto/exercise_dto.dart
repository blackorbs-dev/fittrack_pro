import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_dto.freezed.dart';

@freezed
class ExerciseDto with _$ExerciseDto {
  const ExerciseDto({
    required this.currentExerciseNumber,
    required this.currentExercise,
    required this.totalExercises,
    required this.timeRemaining,
    required this.isPaused,
    required this.heartRate,
    required this.sessionId,
    required this.message,
    required this.isStopped
  });

  @override
  final int currentExerciseNumber;
  @override
  final String sessionId;
  @override
  final String currentExercise;
  @override
  final int totalExercises;
  @override
  final int timeRemaining;
  @override
  final int heartRate;
  @override
  final bool isPaused;
  @override
  final bool isStopped;
  @override
  final String message;

  factory ExerciseDto.fromJson(Map<String, dynamic> json) =>
      ExerciseDto(
        currentExerciseNumber: json['currentExerciseNumber'] as int? ?? 0,
        currentExercise: json['currentExercise'] as String? ?? '',
        totalExercises: json['totalExercises'] as int? ?? 0,
        timeRemaining: json['timeRemaining'] as int? ?? 0,
        isPaused: json['isPaused'] as bool? ?? false,
        isStopped: json['isStopped'] as bool? ?? false,
        heartRate: json['heartRate'] as int? ?? 0,
        sessionId: json['sessionId'] as String? ?? '',
        message: json['message'] as String? ?? '',
      );
}
