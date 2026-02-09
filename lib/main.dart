import 'dart:async';

import 'package:clipboard_manager/design/design.dart';
import 'package:clipboard_manager/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

late final PackageInfo appInfo;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  appInfo = await PackageInfo.fromPlatform();

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final foo = ClipboardService();

  @override
  void initState() {
    super.initState();

    foo.listen();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.buildAppTheme(),
      home: const Scaffold(body: WindowShell()),
    );
  }
}

class ClipboardEventChannel {
  static const _channel = EventChannel('clipboard/events');

  Stream<Map<String, dynamic>> get stream =>
      _channel.receiveBroadcastStream().map(
        (event) {
          print('event: $event');
          return Map<String, dynamic>.from(event as Map<dynamic, dynamic>);
        },
      );
}

class ClipboardService {
  final _channel = ClipboardEventChannel();

  Stream<ClipboardItem> listen() {
    final foo = _channel.stream.map(ClipboardItem.fromMap);

    foo.listen((bar) {
      print(bar);
    });

    return foo.distinct((a, b) => a.value == b.value);
  }
}

class ClipboardItem {
  ClipboardItem({
    required this.value,
    required this.timestamp,
  });

  factory ClipboardItem.fromMap(Map<String, dynamic> map) {
    return ClipboardItem(
      value: map['value'] as String,
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        ((map['timestamp'] as int) * 1000).toInt(),
      ),
    );
  }
  final String value;
  final DateTime timestamp;
}
