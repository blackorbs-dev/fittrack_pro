import UIKit
import Flutter
// This is required for calling FlutterLocalNotificationsPlugin.setPluginRegistrantCallback method.
import flutter_local_notifications

@main
@objc class AppDelegate: FlutterAppDelegate {
    let manager = WorkoutManager()

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // This is required to make any communication available in the action isolate.
        FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
            GeneratedPluginRegistrant.register(with: registry)
        }

        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
        }

        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        let messenger = controller.binaryMessenger

        // METHOD CHANNEL
        let methodChannel = FlutterMethodChannel(name: "fittrack/workoutAction", binaryMessenger: messenger)
        methodChannel.setMethodCallHandler { [weak self] call, result in
            guard let self = self else { return }
            switch call.method {
            case "startWorkout":
                self.manager.startWorkout()
                result(nil)
            case "pauseWorkout":
                self.manager.pauseWorkout()
                result(nil)
            case "resumeWorkout":
                self.manager.resumeWorkout()
                result(nil)
            case "stopWorkout":
                self.manager.stopWorkout()
                result(nil)
            case "nextExercise":
                self.manager.nextExercise()
                result(nil)
            case "previousExercise":
                self.manager.previousExercise()
                result(nil)
            default:
                result(FlutterMethodNotImplemented)
            }
        }

        // EVENT CHANNEL
        let eventChannel = FlutterEventChannel(name: "fittrack/workoutStream", binaryMessenger: messenger)
        eventChannel.setStreamHandler(StreamHandler(manager: manager))

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
