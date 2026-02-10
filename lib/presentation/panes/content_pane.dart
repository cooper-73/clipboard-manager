import 'package:clipboard_manager/design/design.dart';
import 'package:clipboard_manager/presentation/presentation.dart';
import 'package:flutter/material.dart';

class ContentPane extends StatelessWidget {
  const ContentPane({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colors.surface,
      child: const SizedBox(
        width: double.infinity,
        child: Center(
          child: ClipboardPane(),
        ),
      ),
    );
  }
}
