import 'dart:async';
import 'package:fittrack_pro/core/error/extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/error.dart';
import '../../../../core/util/response.dart';
import '../../domain/repository/workout_repository.dart';
import 'workout_event.dart';
import 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  final WorkoutRepository _repository;
  StreamSubscription? _statsSub;

  WorkoutBloc(this._repository) : super(WorkoutState.initial()) {
    on<Started>(_onStarted);
    on<PausedOrResumed>(_onPausedResume);
    on<Paused>(_onPaused);
    on<Resumed>(_onResumed);
    on<Stopped>(_onStopped);
    on<Updated>(_onUpdated);
    on<NextExercise>(_onNext);
    on<PreviousExercise>(_onPrevious);
    on<ResetError>(_onResetError);

    add(WorkoutEvent.started());
  }

  void _onStarted(Started event, Emitter<WorkoutState> emit) {
    _statsSub = _repository.getExerciseDataStream().listen((data) {
      add(WorkoutEvent.updated(data));
    });
  }

  void _onPaused(Paused event, Emitter<WorkoutState> emit){
    _handleResponse(_repository.pauseWorkout, emit);
  }

  void _onResumed(Resumed event, Emitter<WorkoutState> emit){
    _handleResponse(_repository.resumeWorkout, emit);
  }

  void _onPausedResume(PausedOrResumed event, Emitter<WorkoutState> emit) {
    if(state case Loaded(:final data)) {
      if (data.isPaused || data.isStopped) {
        _handleResponse(_repository.resumeWorkout, emit);
      }
      else {
        _handleResponse(_repository.pauseWorkout, emit);
      }
    }
  }

  void _onStopped(Stopped event, Emitter<WorkoutState> emit) {
    if(_isWorkoutStopped()){
      if(state case Loaded(:final data)){
        emit(WorkoutState.loaded(data, errorMessage: 'Workout has already stopped'));
      }
    }
    else {
      _handleResponse(_repository.stopWorkout, emit);
    }
  }

  void _onUpdated(Updated event, Emitter<WorkoutState> emit) {
    emit(WorkoutState.loaded(event.data));
    // 'New Workout State: ${state.data}'.printDebug(tag: 'WorkoutBloc');
  }

  void _onNext(NextExercise event, Emitter<WorkoutState> emit) async{
    _handleResponse(_repository.nextExercise, emit);
  }

  void _onPrevious(PreviousExercise event, Emitter<WorkoutState> emit) {
    _handleResponse(_repository.previousExercise, emit);
  }

  void _onResetError(ResetError event, Emitter<WorkoutState> emit) {
    if(state case Loaded(:final data)){
      emit(WorkoutState.loaded(data));
    }
  }

  bool _isWorkoutStopped(){
    if(state case Loaded(:final data)){
      return data.isPaused || data.isStopped;
    }
    return false;
  }

  Future<void> _handleResponse(Future<Response<void, DataError>> Function() request, Emitter<WorkoutState> emit) async{
    final response = await request();
    response.onError((error) {
      if (state case Loaded(:final data)){
        emit(WorkoutState.loaded(data, errorMessage: error.message()));
      }
    });
  }

  @override
  Future<void> close() {
    _statsSub?.cancel();
    return super.close();
  }
}
