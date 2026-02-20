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

  final isarService = await IsarService.init();

  runApp(
    MultiProvider(
      providers: [
        Provider<ClipboardEventChannel>(create: (_) => ClipboardEventChannel()),
        Provider<ClipboardLocalDatasource>(
          create: (_) => ClipboardLocalDatasourceImpl(isarService.isar),
        ),
        Provider<ClipboardRepository>(
          create: (context) {
            final channel = context.read<ClipboardEventChannel>();
            final localDatasource = context.read<ClipboardLocalDatasource>();

            return ClipboardRepositoryImpl(channel, localDatasource);
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            final repository = context.read<ClipboardRepository>();

            return ClipboardNotifier(repository)..init();
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
