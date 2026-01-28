import 'package:clipboard_manager/design/design.dart';
import 'package:clipboard_manager/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

late final PackageInfo appInfo;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  appInfo = await PackageInfo.fromPlatform();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.buildAppTheme(),
      home: const Scaffold(body: WindowShell()),
    );
  }
}
