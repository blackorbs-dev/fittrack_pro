import Foundation
import Flutter
import UserNotifications

@objc class WorkoutManager: NSObject {
    var timer: Timer?
    var reps = 0
    var heartRate = 75
    var calories = 0.0
    var currentExercise = "Push-ups"
    var currentExerciseNumber = 1
    var totalExercises = 5
    var timeRemaining = 30 * 60
    var isPaused = false
    var isRunning = false
    var sessionId = UUID().uuidString

    var eventSink: FlutterEventSink?

    let exerciseList = ["Push-ups", "Squats", "Planks", "Lunges", "Burpees", "Jumping Jacks"]

    func startWorkout() {
        guard !isRunning else { return }

        isRunning = true
        isPaused = false
        sessionId = UUID().uuidString
        reps = 0
        heartRate = 75
        calories = 0.0
        currentExerciseNumber = 1
        currentExercise = exerciseList[0]
        timeRemaining = 30 * 60

        requestNotificationPermission()
        sendNotification(title: "Workout started", body: "Let's go!")

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            guard self.isRunning, !self.isPaused else { return }

            self.timeRemaining -= 1
            self.reps += 1
            self.heartRate += Int.random(in: 0...2)
            self.calories += 0.5

            if self.timeRemaining <= 0 && self.currentExerciseNumber < self.totalExercises {
                self.currentExerciseNumber += 1
                self.currentExercise = self.exerciseList[(self.currentExerciseNumber - 1) % self.exerciseList.count]
                self.reps = 0
                self.heartRate = 75
                self.calories = 0.0
                self.timeRemaining = 30 * 60
                // self.sendNotification(title: "Next: \(self.currentExercise)", body: "Keep going!")
            }

            self.sendUpdate()
        }
    }

    func pauseWorkout() {
        guard isRunning else { return }
        isPaused = true
        // sendNotification(title: "Workout paused", body: "Tap to resume")
        sendUpdate(message: "Workout paused")
    }

    func resumeWorkout() {
        if !isRunning {
            startWorkout()
            sendUpdate(message: "Workout start requested")
        } else {
            guard isPaused else { return }
            isPaused = false
            // sendNotification(title: "Workout resumed", body: "Let's go!")
            sendUpdate(message: "Workout resumed")
        }
    }

    func stopWorkout() {
        guard isRunning else {
            sendUpdate(message: "Workout service started")
            return
        }

        isRunning = false
        isPaused = true
        timer?.invalidate()
        timer = nil
        // sendNotification(title: "Workout stopped", body: "Session ended")
        sendUpdate(message: "Workout session has stopped")
    }

    func nextExercise() {
        guard isRunning else {
            sendUpdate(message: "Workout session has stopped")
            return
        }

        if currentExerciseNumber < totalExercises {
            currentExerciseNumber += 1
            currentExercise = exerciseList[(currentExerciseNumber - 1) % exerciseList.count]
            reps = 0
            heartRate = 75
            calories = 0.0
            timeRemaining = 30 * 60
            // sendNotification(title: "Next: \(currentExercise)", body: "Keep going!")
            sendUpdate()
        }
    }

    func previousExercise() {
        guard isRunning else { return }

        if currentExerciseNumber > 1 {
            currentExerciseNumber -= 1
            currentExercise = exerciseList[(currentExerciseNumber - 1) % exerciseList.count]
            reps = 0
            heartRate = 75
            calories = 0.0
            timeRemaining = 30 * 60
            // sendNotification(title: "Previous: \(currentExercise)", body: "Stay focused!")
            sendUpdate()
        }
    }

    private func sendUpdate(message: String = "") {
        let content = message.isEmpty
            ? "Set \(currentExerciseNumber)/\(totalExercises) · \(currentExercise)"
            : message

        let data: [String: Any] = [
            "sessionId": sessionId,
            "currentExercise": currentExercise,
            "currentExerciseNumber": currentExerciseNumber,
            "totalExercises": totalExercises,
            "timeRemaining": timeRemaining,
            "isStopped": !isRunning,
            "isPaused": isPaused,
            "heartRate": heartRate,
            "message": content
        ]
        let jsonData = try! JSONSerialization.data(withJSONObject: data)
        let jsonString = String(data: jsonData, encoding: .utf8)!
        eventSink?(jsonString)
    }

    private func sendNotification(title: String, body: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: nil
        )
        UNUserNotificationCenter.current().add(request)
    }

    private func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { _, _ in }
    }
}
