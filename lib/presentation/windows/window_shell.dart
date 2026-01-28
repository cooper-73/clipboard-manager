import 'package:clipboard_manager/design/design.dart';
import 'package:clipboard_manager/presentation/presentation.dart';
import 'package:flutter/material.dart';

class WindowShell extends StatelessWidget {
  const WindowShell({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colors.background,
      child: const Column(
        children: [
          Expanded(child: ContentPane()),
          StatusBar(),
        ],
      ),
    );
  }
}
