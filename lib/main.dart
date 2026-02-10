import 'package:clipboard_manager/core/core.dart';
import 'package:clipboard_manager/data/data.dart';
import 'package:clipboard_manager/design/design.dart';
import 'package:clipboard_manager/domain/domain.dart';
import 'package:clipboard_manager/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

late final PackageInfo appInfo;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  appInfo = await PackageInfo.fromPlatform();

  runApp(
    MultiProvider(
      providers: [
        Provider<ClipboardEventChannel>(create: (_) => ClipboardEventChannel()),
        Provider<ClipboardRepository>(
          create: (context) {
            final channel = context.read<ClipboardEventChannel>();

            return ClipboardRepositoryImpl(channel);
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            final repository = context.read<ClipboardRepository>();

            return ClipboardNotifier(repository)..startListening();
          },
        ),
      ],
      child: const MainApp(),
    ),
  );
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
