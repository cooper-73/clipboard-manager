import 'package:clipboard_manager/design/design.dart';
import 'package:clipboard_manager/main.dart';
import 'package:flutter/material.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colors.surfaceVariant,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.sm,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: AppSpacing.lg,
              children: [
                Row(
                  spacing: AppSpacing.xs,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.xs),
                      decoration: BoxDecoration(
                        color: context.keycapColors.keycapBackground,
                        borderRadius: const BorderRadius.all(AppRadius.xs),
                        border: Border.all(
                          color: context.keycapColors.keycapOutline,
                        ),
                      ),
                      child: Text(
                        '↵',
                        style: context.typography.hint,
                      ),
                    ),
                    Text(
                      'to paste',
                      style: context.typography.hint,
                    ),
                  ],
                ),
                Text(
                  'P to pin',
                  style: context.typography.hint,
                ),
                Text(
                  '⌫ to delete',
                  style: context.typography.hint,
                ),
              ],
            ),
            Text(
              'Clipboard Manager v${appInfo.version}',
              style: context.typography.hint,
            ),
          ],
        ),
      ),
    );
  }
}
