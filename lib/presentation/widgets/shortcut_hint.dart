import 'package:clipboard_manager/design/design.dart';
import 'package:flutter/material.dart';

class ShortcutHint extends StatelessWidget {
  const ShortcutHint({
    super.key,
    required this.shortcut,
  });

  final String shortcut;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xs),
      decoration: BoxDecoration(
        color: context.keycapColors.keycapBackground,
        borderRadius: const BorderRadius.all(AppRadius.xs),
        border: Border.all(
          color: context.keycapColors.keycapOutline,
        ),
      ),
      child: Text(
        shortcut,
        style: context.typography.hint,
      ),
    );
  }
}
