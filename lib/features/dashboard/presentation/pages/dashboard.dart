import 'package:fittrack_pro/core/service/notification_service.dart';
import 'package:fittrack_pro/core/theme/extensions.dart';
import 'package:fittrack_pro/core/util/formatter.dart';
import 'package:fittrack_pro/core/util/main_ext.dart';
import 'package:fittrack_pro/features/dashboard/domain/models/chart_type.dart';
import 'package:fittrack_pro/features/dashboard/presentation/widgets/chart_item.dart';
import 'package:fittrack_pro/features/dashboard/presentation/widgets/custom_chart.dart';
import 'package:fittrack_pro/features/dashboard/presentation/widgets/item_container.dart';
import 'package:fittrack_pro/features/dashboard/presentation/widgets/loading_box.dart';
import 'package:fittrack_pro/features/dashboard/presentation/widgets/morphing_fab.dart';
import 'package:fittrack_pro/features/dashboard/presentation/widgets/outlined_button.dart';
import 'package:fittrack_pro/features/shared/components/label_text.dart';
import 'package:fittrack_pro/features/workout/presentation/pages/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../../core/service/toast_manager.dart';
import '../cubit/dashboard_cubit.dart';
import '../widgets/stat_card.dart';

class DashboardScreen extends StatelessWidget{
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(
          context.read(),
          NotificationService(FlutterLocalNotificationsPlugin())
      ), // notification service is scoped to DashboardCubit
      child: const DashboardView()
    );
  }

}

class DashboardView extends StatefulWidget{
  const DashboardView({super.key});
  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _bounces;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    // generate sequence animation values for stat cards
    _bounces = List.generate(4, (index) {
      final start = index * 0.15;
      final end = start + 0.5;

      return Tween<double>(begin: -4, end: 4).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeInOut),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final cardAspectRatio = context.gridChildAspectRatio(itemHeight: 148);
    final actionButtonAspectRatio = context.gridChildAspectRatio(itemHeight: 52);

    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<DashboardCubit, DashboardState>(
          listener: (context, state){
            if(state case Loaded(:final errorMessage)){
              if(errorMessage != null) {
                ToastManager().show(context, errorMessage);
                context.read<DashboardCubit>().resetError();
              }
            }
          },
          buildWhen: (previous, next){
            // prevent unnecessary build if only errorMessage has changed
            if(previous is Loaded && next is Loaded){
              return previous.workoutStats != next.workoutStats
                  || previous.selectedChart != next.selectedChart;
            }
            return true;
          },
          builder: (context, state){
            if(state case Loaded(:final workoutStats, :final selectedChart)){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 14),
                child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome Jamiu \u{1F44B}',
                                  style: context.theme.textTheme.headlineSmall
                                      .withColor(context.theme.colors.lightForeground),
                                ),
                                Text(
                                  'Last updated: ${workoutStats.lastUpdated.toTimeString()}',
                                  style: context.theme.textTheme.bodyLarge
                                      .withColor(context.theme.colors.lightMutedForeground),

                                ),
                                LabelText(
                                  'You are on fire, keep the streak going \u{1F525}',
                                  margin: const EdgeInsets.only(top: 10, bottom: 18),
                                )
                              ]
                          )
                      ),
                      SliverGrid.count(
                        crossAxisCount: 2,
                        childAspectRatio: cardAspectRatio,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        children: [
                          StatCard(
                            title: 'Workouts',
                            count: workoutStats.totalWorkouts,
                            smallText: 'This month',
                            icon: 'assets/icons/vital_signs.svg',
                            gradientColors: [
                              context.theme.colors.primary,
                              context.theme.colors.secondary,
                            ],
                            bounceAnimation: _bounces[0],
                          ),
                          StatCard(
                            title: 'Calories',
                            count: workoutStats.totalCaloriesBurned,
                            smallText: 'Total burned',
                            icon: 'assets/icons/electric_bolt.svg',
                            gradientColors: [
                              context.theme.colors.secondary,
                              context.theme.colors.accent,
                            ],
                            bounceAnimation: _bounces[1],
                          ),
                          StatCard(
                            title: 'Active Minutes',
                            count: workoutStats.totalDuration.inMinutes,
                            smallText: 'This week',
                            icon: 'assets/icons/target.svg',
                            gradientColors: [
                              context.theme.colors.accent,
                              context.theme.colors.primary,
                            ],
                            bounceAnimation: _bounces[2],
                          ),
                          StatCard(
                            title: 'Avg Heart Rate',
                            count: workoutStats.averageHeartRate,
                            unitText: ' bpm',
                            smallText: 'During workouts',
                            icon: 'assets/icons/favorite.svg',
                            gradientColors: [
                              context.theme.colors.darkDestructive,
                              context.theme.colors.darkBackground,
                            ],
                            bounceAnimation: _bounces[3],
                          )
                        ],
                      ),
                      SliverToBoxAdapter(
                          child: ItemContainer(
                              title: 'Workout Progress',
                              subtitle: 'Track your fitness progress over time',
                              icon: 'assets/icons/moving_up.svg',
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ChartItem(
                                          type: ChartType.heartRate,
                                          icon: 'assets/icons/vital_signs.svg',
                                          title: 'Heart Rate',
                                          isSelected: ChartType.heartRate == selectedChart
                                      ),
                                      ChartItem(
                                          type: ChartType.calories,
                                          icon: 'assets/icons/moving_up.svg',
                                          title: 'Calories',
                                          isSelected: ChartType.calories == selectedChart
                                      ),
                                    ],
                                  ),
                                  LineChart(data: workoutStats.chartData[selectedChart]??[])
                                ],
                              )
                          )
                      ),
                      SliverToBoxAdapter(
                          child: ItemContainer(
                              title: 'Quick Actions',
                              subtitle: 'Jump into your next workout',
                              icon: 'assets/icons/calendar.svg',
                              child: GridView.count(
                                  crossAxisCount: 2,
                                  shrinkWrap: true,
                                  mainAxisSpacing: 12,
                                  crossAxisSpacing: 12,
                                  childAspectRatio: actionButtonAspectRatio,
                                  children: [
                                    FilledButton(
                                        onPressed: context.read<DashboardCubit>().startWorkout,
                                        style: ButtonStyle(
                                            textStyle: WidgetStateProperty.all(context.theme.textTheme.bodyMedium),
                                            backgroundColor: WidgetStateProperty.all(context.theme.colors.primary),
                                            foregroundColor: WidgetStateProperty.all(context.theme.colors.lightForeground),
                                            shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))
                                        ),
                                        child: Text('Start Workout')
                                    ),
                                    OutlineButton(
                                      text: 'Track Progress',
                                      color: context.theme.colors.accent,
                                      onPressed: (){
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) => const WorkoutScreen()
                                            )
                                        );
                                      },
                                    ),
                                    OutlineButton(
                                      text: 'View Schedule',
                                      color: context.theme.colors.secondary,
                                    ),
                                    OutlineButton(
                                      text: 'Set Goals',
                                      color: context.theme.colors.error,
                                    ),
                                  ]
                              )
                          )
                      ),
                      SliverPadding(padding: const EdgeInsets.only(bottom: 32))
                    ]
                ),
              );
            }
            return const LoadingBox();
          },
        ),
      ),
      floatingActionButton: const MorphingFab(),
    );
  }

}