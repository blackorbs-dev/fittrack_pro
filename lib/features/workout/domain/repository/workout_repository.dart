import 'package:fittrack_pro/core/util/response.dart';

import '../../../../core/error/error.dart';
import '../../../dashboard/domain/models/workout_session.dart';
import '../models/exercise_data.dart';

abstract class WorkoutRepository{
  Future<Response<void, DataError>> startWorkout();
  Future<Response<void, DataError>> pauseWorkout();
  Future<Response<void, DataError>> resumeWorkout();
  Future<Response<void, DataError>> stopWorkout();
  Future<Response<void, DataError>> nextExercise();
  Future<Response<void, DataError>> previousExercise();
  Future<Response<void, DataError>> sendAction(String actionId);
  Stream<ExerciseData> getExerciseDataStream();
  Stream<List<WorkoutSession>> getWorkoutHistoryStream();
  void dispose();
}