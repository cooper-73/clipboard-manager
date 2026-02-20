import 'package:clipboard_manager/design/design.dart';
import 'package:clipboard_manager/presentation/presentation.dart';
import 'package:flutter/material.dart';

class WindowShell extends StatelessWidget {
  const WindowShell({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colors.surface,
      child: Column(
        children: [
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: AppMetrics.contentMinWidth,
                maxWidth: AppMetrics.contentMaxWidth,
              ),
              child: const ContentPane(),
            ),
          ),
          const StatusBar(),
        ],
      ),
    );
  }
}
