import Cocoa

class ClipboardListener {
    private var timer: Timer?
    private var lastChangeCount = NSPasteboard.general.changeCount
    private var onChange: (([String: Any]) -> Void)?

    func start(onChange: @escaping ([String: Any]) -> Void) {
        stop()
        self.onChange = onChange

        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { [weak self] _ in
            guard let self = self else { return }

            let pasteboard = NSPasteboard.general
            if pasteboard.changeCount != self.lastChangeCount {
                self.lastChangeCount = pasteboard.changeCount

                if let text = pasteboard.string(forType: .string) {
                    self.onChange?([
                        "value": text,
                        "timestamp": Int(Date().timeIntervalSince1970 * 1000)
                    ])
                }
            }
        }
    }

    func stop() {
        timer?.invalidate()
        timer = nil
        onChange = nil
    }
}
