import 'package:flutter/services.dart';

class ClipboardEventChannel {
  static const _channel = EventChannel('clipboard/events');

  Stream<Map<String, dynamic>> get stream =>
      _channel.receiveBroadcastStream().map(
        (event) => Map<String, dynamic>.from(event as Map<dynamic, dynamic>),
      );
}
