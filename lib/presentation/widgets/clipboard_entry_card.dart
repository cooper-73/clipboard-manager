import 'package:clipboard_manager/core/core.dart';
import 'package:clipboard_manager/design/design.dart';
import 'package:clipboard_manager/domain/domain.dart';
import 'package:flutter/material.dart';

class ClipboardEntryCard extends StatelessWidget {
  const ClipboardEntryCard({
    super.key,
    required this.clipboardItem,
  });

  final ClipboardItem clipboardItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(AppRadius.md),
        border: Border.all(
          color: Colors.transparent,
        ),
      ),
      child: Row(
        spacing: AppSpacing.md,
        children: [
          SizedBox.square(
            dimension: 36,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(AppRadius.sm),
                border: Border.all(color: context.colors.outlineVariant),
              ),
              child: Icon(
                Icons.description_outlined,
                size: 20,
                color: context.colors.textSecondary,
              ),
            ),
          ),
          Expanded(
            child: Column(
              spacing: 2,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  clipboardItem.value,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: context.typography.body,
                ),
                Row(
                  spacing: AppSpacing.sm,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(AppRadius.xs),
                        border: Border.all(
                          color: context.colors.outlineVariant,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.xs,
                          vertical: AppSpacing.xxs,
                        ),
                        child: Text(
                          'Text',
                          style: context.typography.keyHint,
                        ),
                      ),
                    ),
                    Text(
                      clipboardItem.createdAt.timeAgo,
                      style: context.typography.tertiary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
