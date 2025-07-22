import 'package:fittrack_pro/features/workout/data/dto/exercise_dto.dart';

import '../../domain/models/exercise_data.dart';

extension X on ExerciseDto{
  ExerciseData toData() =>
      ExerciseData(
        currentExerciseNumber: currentExerciseNumber,
        currentExercise: currentExercise,
        totalExercises: totalExercises,
        timeRemaining: timeRemaining,
        isPaused: isPaused,
        heartRate: heartRate,
        sessionId: sessionId,
        message: message,
        isStopped: isStopped
      );
}