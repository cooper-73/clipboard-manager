import 'package:clipboard_manager/design/design.dart';
import 'package:clipboard_manager/domain/domain.dart';
import 'package:clipboard_manager/presentation/presentation.dart';
import 'package:flutter/material.dart';

class ClipboardHistory extends StatelessWidget {
  const ClipboardHistory({
    super.key,
    required this.clipboardItems,
  });

  final List<ClipboardItem> clipboardItems;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.md,
      ),
      itemCount: clipboardItems.length,
      itemBuilder: (context, index) {
        final clipboardItem = clipboardItems[index];

        return ClipboardEntryCard(
          key: ValueKey(clipboardItem.createdAt),
          clipboardItem: clipboardItem,
        );
      },
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppSpacing.xxs),
    );
  }
}
