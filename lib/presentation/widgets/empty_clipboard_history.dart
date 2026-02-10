import 'package:clipboard_manager/design/design.dart';
import 'package:clipboard_manager/presentation/presentation.dart';
import 'package:flutter/material.dart';

class EmptyClipboardHistory extends StatelessWidget {
  const EmptyClipboardHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSpacing.xxl,
      mainAxisSize: MainAxisSize.min,
      children: [
        const ClipboardBadge(),
        Column(
          spacing: AppSpacing.md,
          children: [
            Text(
              'Your clipboard history will appear here',
              textAlign: TextAlign.center,
              style: context.typography.emptyTitle,
            ),
            Text(
              'Start copying text to see your history.',
              textAlign: TextAlign.center,
              style: context.typography.emptyDescription,
            ),
          ],
        ),
        const ShortcutHintPill(),
      ],
    );
  }
}
