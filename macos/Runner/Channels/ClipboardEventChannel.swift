import FlutterMacOS

class ClipboardEventChannel {
    static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterEventChannel(
            name: "clipboard/events",
            binaryMessenger: registrar.messenger
        )

        channel.setStreamHandler(ClipboardStreamHandler())
    }
}
