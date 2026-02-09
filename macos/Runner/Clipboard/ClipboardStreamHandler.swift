import FlutterMacOS
import Cocoa

class ClipboardStreamHandler: NSObject, FlutterStreamHandler {
    private var eventSink: FlutterEventSink?
    private let listener = ClipboardListener()

    func onListen(withArguments arguments: Any?,
                  eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        self.eventSink = events

        listener.start { [weak self] payload in
            self?.eventSink?(payload)
        }

        return nil
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        listener.stop()
        eventSink = nil

        return nil
    }
}
