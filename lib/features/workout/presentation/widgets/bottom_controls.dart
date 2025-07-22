import 'package:fittrack_pro/core/theme/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/workout_bloc.dart';
import '../bloc/workout_event.dart';
import '../bloc/workout_state.dart';

class BottomControls extends StatelessWidget{
  const BottomControls({super.key});

  @override
  Widget build(BuildContext context) {

    void handleEvent(WorkoutEvent event){
      context.read<WorkoutBloc>().add(event);
    }

    return Container(
      padding: const EdgeInsets.only(top: 4, bottom: 20),
      decoration: BoxDecoration(
          color: context.theme.colors.darkBackground,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28)
          ),
          border: Border.all(
            color: context.theme.colors.lightSecondary
          )
      ),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 52, height: 6,
              margin: const EdgeInsets.only(top: 8, bottom: 26),
              decoration: BoxDecoration(
                color: context.theme.colors.lightSecondary,
                borderRadius: BorderRadius.circular(12)
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton.filled(
                      iconSize: 32,
                      onPressed: ()=>handleEvent(WorkoutEvent.previousExercise()),
                      color: context.theme.colors.white,
                      style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(context.theme.colors.lightSecondary)
                      ),
                      icon: Icon(Icons.skip_previous_rounded)
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                          onTap: ()=>handleEvent(WorkoutEvent.pausedOrResumed()),
                          radius: 32,
                          child: Container(
                              width: 72, height: 72,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                      colors: [
                                        context.theme.colors.primary,
                                        context.theme.colors.secondary
                                      ]
                                  )
                              ),
                              child: BlocSelector<WorkoutBloc, WorkoutState, bool>(
                                  selector: (state){
                                    if(state case Loaded(:final data)){
                                      return data.isPaused || data.isStopped;
                                    }
                                    return true;
                                  },
                                  builder: (context, isPaused){
                                    return AnimatedSwitcher(
                                        duration: Duration(milliseconds: 300),
                                        transitionBuilder: (child, animation) {
                                          return ScaleTransition(scale: animation, child: child);
                                        },
                                        child: Icon(
                                            isPaused ? Icons.play_arrow_rounded : Icons.pause_rounded,
                                            key: ValueKey<bool>(isPaused),
                                            color: context.theme.colors.white,
                                            size: 28,
                                        )
                                    );
                                  }
                              )
                          )
                      )
                  ),
                  IconButton.filled(
                      iconSize: 32,
                      onPressed: ()=>handleEvent(WorkoutEvent.nextExercise()),
                      color: context.theme.colors.white,
                      style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(context.theme.colors.lightSecondary)
                      ),
                      icon: Icon(Icons.skip_next_rounded)
                  )
                ]
            ),
            SizedBox(height: 12,),
            IconButton.filled(
                iconSize: 32,
                onPressed: ()=>handleEvent(WorkoutEvent.stopped()),
                color: context.theme.colors.pink,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(context.theme.colors.pinkDark)
                ),
                icon: Icon(Icons.stop_rounded)
            )
          ]
      ),
    );
  }

}