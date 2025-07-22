package blackorbs.dev.fittrack_pro

import android.app.*
import android.content.*
import android.os.*
import android.util.Log
import androidx.core.app.NotificationCompat
import io.flutter.plugin.common.EventChannel
import org.json.JSONObject
import kotlin.concurrent.fixedRateTimer
import java.util.Timer
import android.os.PowerManager
import java.util.UUID

class WorkoutService : Service() {
    private var wakeLock: PowerManager.WakeLock? = null
    private var timer: Timer? = null

    private var heartRate = 75
    private var exercise = "Push-ups"
    private var isRunning = false
    private var isPaused = false
    private var totalExercises = 5
    private var currentExerciseNumber = 1
    private var timeRemaining = 30 * 60 // 30 minutes in seconds
    private var sessionId: String = ""

    override fun onCreate() {
        Log.d("WorkoutService","OnCreate")
        super.onCreate()
        createNotificationChannel()
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        when (intent?.action) {
            ACTION_START -> startWorkout()
            ACTION_PAUSE -> pauseWorkout()
            ACTION_RESUME -> resumeWorkout()
            ACTION_STOP -> stopWorkout()
            ACTION_NEXT -> nextExercise()
            ACTION_PREV -> previousExercise()
        }
        return START_STICKY
    }

    private fun startWorkout() {
        if (isRunning) return
        isRunning = true
        isPaused = false
        sessionId = UUID.randomUUID().toString() // Generate new session ID
        val powerManager = getSystemService(POWER_SERVICE) as PowerManager
        wakeLock = powerManager.newWakeLock(
            PowerManager.PARTIAL_WAKE_LOCK,
            "fittrack:WorkoutWakeLock"
        )
        wakeLock?.acquire()

        startForeground(1, buildNotification("Workout started"))

        timer = fixedRateTimer("WorkoutTimer", true, 0L, 1000L) {
            if (!isRunning || isPaused) return@fixedRateTimer

            heartRate += (0..2).random()
            timeRemaining = (timeRemaining - 1).coerceAtLeast(0)

            if (timeRemaining == 0 && currentExerciseNumber < totalExercises) {
                currentExerciseNumber++
                exercise = getNextExercise(currentExerciseNumber)
                timeRemaining = 30 * 60
                heartRate = 75
            }
            sendUpdate()
        }
    }

    private fun sendUpdate(message: String = ""): JSONObject {
        val content = message.ifEmpty{
            "Set $currentExerciseNumber/$totalExercises · " +
                    "$exercise"
        }
        val data = JSONObject().apply {
            put("sessionId", sessionId) // Include sessionId in update
            put("currentExercise", exercise)
            put("heartRate", heartRate)
            put("currentExerciseNumber", currentExerciseNumber)
            put("totalExercises", totalExercises)
            put("timeRemaining", timeRemaining)
            put("isStopped", !isRunning)
            put("isPaused", isPaused)
            put("message", content)
        }
        EventChannelPlugin.sendStats(data.toString())
        return data
    }

    private fun pauseWorkout() {
        if (!isRunning || isPaused) return
        isPaused = true
        sendUpdate("Workout paused")
    }

    private fun resumeWorkout() {
        if(!isRunning){
            startWorkout()
            sendUpdate("Workout start requested")
        }
        else {
            if (!isPaused) return
            isPaused = false
            sendUpdate("Workout resumed")
        }
    }

    private fun stopWorkout() {
        if(!isRunning){
            startForeground(1, buildNotification("Workout service started"))
            return
        }
        isRunning = false
        isPaused = true
        timer?.cancel()
        wakeLock?.let {
            if (it.isHeld) it.release()
            wakeLock = null
        }
        sendUpdate("Workout session has stopped")
        stopForeground(true)
        stopSelf()
    }

    private fun nextExercise() {
        if (!isRunning) {
            sendUpdate("Workout session has stopped")
            return
        }
        if (currentExerciseNumber < totalExercises) {
            currentExerciseNumber++
            exercise = getNextExercise(currentExerciseNumber)
            timeRemaining = 30 * 60
            heartRate = 75
            sendUpdate()
        } else {
            Log.d("WorkoutService", "Already on last exercise")
        }
    }

    private fun previousExercise() {
        if (!isRunning) return
        if (currentExerciseNumber > 1) {
            currentExerciseNumber--
            exercise = getNextExercise(currentExerciseNumber)
            timeRemaining = 30 * 60
            heartRate = 75
            sendUpdate()
        } else {
            Log.d("WorkoutService", "Already on first exercise")
        }
    }

    private fun buildNotification(content: String): Notification {
        val builder = NotificationCompat.Builder(this, CHANNEL_ID)
            .setContentTitle("🏋️ FitTrack Pro")
            .setContentText(content)
            .setSmallIcon(R.mipmap.ic_launcher)

        return builder.build()
    }

    private fun createNotificationChannel() {
        val channel = NotificationChannel(CHANNEL_ID, "Workout", NotificationManager.IMPORTANCE_LOW)
        getSystemService(NotificationManager::class.java).createNotificationChannel(channel)
    }

    private fun getNextExercise(index: Int): String {
        val list = listOf("Push-ups", "Squats", "Planks", "Lunges", "Burpees", "Jumping Jacks")
        return list.getOrElse(index % list.size) { "Push-ups" }
    }

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onDestroy() {
        timer?.cancel()
        wakeLock?.release()
        wakeLock = null
        super.onDestroy()
    }

    companion object {
        private const val CHANNEL_ID = "fittrack_channel"
        const val ACTION_START = "fittrack.ACTION_START"
        const val ACTION_PAUSE = "fittrack.ACTION_PAUSE"
        const val ACTION_RESUME = "fittrack.ACTION_RESUME"
        const val ACTION_STOP = "fittrack.ACTION_STOP"
        const val ACTION_NEXT = "fittrack.ACTION_NEXT"
        const val ACTION_PREV = "fittrack.ACTION_PREV"
    }
}

