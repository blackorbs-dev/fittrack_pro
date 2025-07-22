import 'package:fittrack_pro/core/service/toast_manager.dart';
import 'package:fittrack_pro/core/theme/extensions.dart';
import 'package:fittrack_pro/features/dashboard/presentation/widgets/loading_box.dart';
import 'package:fittrack_pro/features/shared/components/label_text.dart';
import 'package:fittrack_pro/features/workout/presentation/bloc/workout_state.dart';
import 'package:fittrack_pro/features/workout/presentation/widgets/heart_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/workout_bloc.dart';
import '../bloc/workout_event.dart';
import '../widgets/bottom_controls.dart';
import '../widgets/progress_ring.dart';

class WorkoutScreen extends StatelessWidget{
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkoutBloc(context.read()),
      child: const WorkoutView(),
    );
  }

}

class WorkoutView extends StatelessWidget{
  const WorkoutView({super.key});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
        onHorizontalDragEnd: (details){
          _handleHorizontalSwipe(details, context.read<WorkoutBloc>().add);
        },
        onVerticalDragEnd: (details){
          _handleVerticalSwipe(details, context.read<WorkoutBloc>().add);
        },
        child: BlocConsumer<WorkoutBloc, WorkoutState>(
          listener: (context, state) {
            if(state case Loaded(:final errorMessage)){
              if(errorMessage != null) {
                ToastManager().show(context, errorMessage);
                context.read<WorkoutBloc>().add(WorkoutEvent.resetError());
              }
            }
          },
          buildWhen: (previous, next){
            // prevents unnecessary build if error message was emitted without changes to the previously loaded data
            if(previous is Loaded && next is Loaded){
              return previous.data != next.data;
            }
            return true;
          },
          builder: (context, state){
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: context.theme.colors.black,
                leading: BackButton(
                  style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all(context.theme.colors.white)
                  ),
                ),
                title: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 4),
                          child: Text(
                              'HIIT Training', style: context.theme.textTheme.titleMedium
                              .withColor(context.theme.colors.white)
                          )
                      ),
                      if(state case Loaded(:final data))
                        Text(
                            'Set ${data.currentExerciseNumber} of ${data.totalExercises}',
                            style: context.theme.textTheme.bodySmall
                                .withColor(context.theme.colors.lightMutedForeground)
                        )
                    ]
                ),
              ),
              body: SafeArea(
                child: Builder(
                  builder: (context){
                    if(state case Loaded(:final data)){
                      final minutes = (data.timeRemaining/60).toInt();

                      return Center(child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 32, bottom: 28),
                              child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    ProgressRing(
                                        progress: data.currentExerciseNumber/data.totalExercises
                                    ),
                                    Column(
                                        children: [
                                          Text(
                                              '$minutes:${data.timeRemaining-minutes*60}',
                                              style: context.theme.textTheme.headlineLarge
                                                  .withColor(context.theme.colors.white)
                                          ),
                                          SizedBox(height: 6),
                                          Text(
                                              'Time Remaining',
                                              style: context.theme.textTheme.bodySmall
                                                  .withColor(context.theme.colors.lightMutedForeground)
                                          ),
                                          LabelText(data.currentExercise)
                                        ]
                                    )
                                  ]
                              ),
                            ),
                            HeartBox(heartRate: data.heartRate)
                          ]
                      ));
                    }
                    return const LoadingBox();
                  },
                ),
              ),
              bottomSheet: const BottomControls(),
            );
          },
        )
    );
  }

  void _handleHorizontalSwipe(DragEndDetails details, void Function(WorkoutEvent) callback){
    HapticFeedback.lightImpact();
    final velocity = details.primaryVelocity ?? 0;
    if(velocity > 0){
      // Swipe Right → Previous Exercise
      callback(WorkoutEvent.previousExercise());
    }
    else if(velocity < 0){
      // Swipe Left → Next Exercise
      callback(WorkoutEvent.nextExercise());
    }
  }

  void _handleVerticalSwipe(DragEndDetails details, void Function(WorkoutEvent) callback){
    HapticFeedback.lightImpact();
    final velocity = details.primaryVelocity ?? 0;
    if(velocity > 0){
      // Swipe Down → Pause Exercise
      callback(WorkoutEvent.paused());
    }
    else if(velocity < 0){
      // Swipe Up → Resume Exercise
      callback(WorkoutEvent.resumed());
    }
  }

}