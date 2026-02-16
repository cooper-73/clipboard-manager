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
      findChildIndexCallback: (key) {
        final valueKey = key as ValueKey<int>;

        final index = clipboardItems.indexWhere(
          (item) => item.createdAt.millisecondsSinceEpoch == valueKey.value,
        );

        return index != -1 ? 2 * index : null;
      },
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppSpacing.xxs),
      itemBuilder: (context, index) {
        final clipboardItem = clipboardItems[index];

        return ClipboardEntryCard(
          key: ValueKey(clipboardItem.createdAt.millisecondsSinceEpoch),
          clipboardItem: clipboardItem,
        );
      },
    );
  }
}
