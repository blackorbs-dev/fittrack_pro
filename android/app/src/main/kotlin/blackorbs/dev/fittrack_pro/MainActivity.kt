package blackorbs.dev.fittrack_pro

import android.content.Intent
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.EventChannel

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "fittrack/workoutAction").setMethodCallHandler {
                call, result ->
            when (call.method) {
                "startWorkout" -> {
                    sendAction(WorkoutService.ACTION_START)
                    result.success(null)
                }
                "pauseWorkout" -> {
                    sendAction(WorkoutService.ACTION_PAUSE)
                    result.success(null)
                }
                "resumeWorkout" -> {
                    sendAction(WorkoutService.ACTION_RESUME)
                    result.success(null)
                }
                "stopWorkout" -> {
                    sendAction(WorkoutService.ACTION_STOP)
                    result.success(null)
                }
                "nextExercise" -> {
                    sendAction(WorkoutService.ACTION_NEXT)
                    result.success(null)
                }
                "previousExercise" -> {
                    sendAction(WorkoutService.ACTION_PREV)
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, "fittrack/workoutStream")
            .setStreamHandler(EventChannelPlugin)
    }

    private fun sendAction(action: String) {
        val intent = Intent(applicationContext, WorkoutService::class.java).apply { this.action = action }
        startForegroundService(intent)
        Log.d("WorkoutService","SendingAction......$action")
    }
}


