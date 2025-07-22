import 'dart:async';
import 'dart:io';

import 'package:fittrack_pro/core/error/extensions.dart';
import 'package:fittrack_pro/features/workout/domain/models/exercise_data.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../constants/app_constants.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin _plugin;
  final _notificationId = 1;

  NotificationService(this._plugin) { _initialise(); }

  final _notificationActionController = StreamController<String>.broadcast();

  Stream<String> get onNotificationAction => _notificationActionController.stream;

  void _initialise() async{
    final initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(
        notificationCategories: [
          DarwinNotificationCategory(
            AppConstant.workoutCategory,
            actions: [
              DarwinNotificationAction.plain(
                  AppConstant.pauseWorkout, '⏸ Pause',
                  options: { DarwinNotificationActionOption.foreground }
              ),
              DarwinNotificationAction.plain(
                  AppConstant.resumeWorkout, '▶ Resume',
                  options: { DarwinNotificationActionOption.foreground }
              ),
              DarwinNotificationAction.plain(
                  AppConstant.stopWorkout, "⏹ Stop",
                  options: { DarwinNotificationActionOption.foreground }
              ),
            ],
          )
        ],
      ),
    );
    await _plugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: _onNotificationAction
    );
    requestNotificationPermission();
  }

  void showWorkoutNotification(ExerciseData data) {
    _plugin.show(
      _notificationId, "🏋️ FitTrack Pro",
      data.message,
      NotificationDetails(
        android: AndroidNotificationDetails(
            AppConstant.channelId, 'Workout',
            ongoing: true,
            progress: data.currentExerciseNumber,
            maxProgress: data.totalExercises,
            actions: data.isStopped ? null : [
              AndroidNotificationAction(
                  data.isPaused ? AppConstant.resumeWorkout : AppConstant.pauseWorkout,
                  data.isPaused ? '▶ Resume' : '⏸ Pause',
                  showsUserInterface: true
              ),
              AndroidNotificationAction(
                  AppConstant.stopWorkout, "⏹ Stop",
                  showsUserInterface: true
              ),
            ]
        ),
        iOS: DarwinNotificationDetails(
          categoryIdentifier: data.isStopped ? null : AppConstant.workoutCategory
        ),
      ),
    );
  }

  void _onNotificationAction(NotificationResponse response){
    final actionId = response.actionId;
    actionId?.printDebug(tag: 'ForegroundReceiver');
    response.payload?.printDebug(tag: 'ForegroundReceiver');
    if(actionId != null){
      _notificationActionController.add(actionId);
    }
  }

  void cancelWorkoutNotification() {
    _plugin.cancel(_notificationId);
  }

  void requestNotificationPermission() {
    if (Platform.isAndroid) {
      _plugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
    }
  }

  void dispose(){
    _notificationActionController.close();
  }
}
