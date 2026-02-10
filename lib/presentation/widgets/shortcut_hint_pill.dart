import 'package:clipboard_manager/design/design.dart';
import 'package:clipboard_manager/presentation/presentation.dart';
import 'package:flutter/material.dart';

class ShortcutHintPill extends StatelessWidget {
  const ShortcutHintPill({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colors.surfaceVariant,
        borderRadius: const BorderRadius.all(AppRadius.xl),
        border: Border.all(color: context.colors.outline),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.sm,
        ),
        child: Row(
          spacing: AppSpacing.sm,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'TIP',
              style: context.typography.hint,
            ),
            SizedBox(
              height: AppSpacing.lg,
              width: 1,
              child: ColoredBox(color: context.colors.outline),
            ),
            Text(
              'Press',
              style: context.typography.tertiary,
            ),
            const ShortcutHint(shortcut: '⌘ + C'),
            Text(
              'to copy text',
              style: context.typography.tertiary,
            ),
          ],
        ),
      ),
    );
  }
}
