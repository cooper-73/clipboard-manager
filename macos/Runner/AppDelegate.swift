import Cocoa
import FlutterMacOS

@main
class AppDelegate: FlutterAppDelegate {
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }

  override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }

  override func applicationDidFinishLaunching(_ notification: Notification) {
    guard let controller =
      mainFlutterWindow?.contentViewController as? FlutterViewController
    else {
      return
    }

    let registrar = controller.registrar(forPlugin: "ClipboardEventChannel")

    ClipboardEventChannel.register(with: registrar)

    super.applicationDidFinishLaunching(notification)
  }
}
