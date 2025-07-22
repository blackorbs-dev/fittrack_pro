import Flutter

class StreamHandler: NSObject, FlutterStreamHandler {
    let manager: WorkoutManager

    init(manager: WorkoutManager) {
        self.manager = manager
    }

    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        manager.eventSink = events
        return nil
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        manager.eventSink = nil
        return nil
    }
}
