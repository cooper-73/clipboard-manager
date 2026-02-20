import 'package:clipboard_manager/design/design.dart';
import 'package:clipboard_manager/domain/domain.dart';
import 'package:clipboard_manager/presentation/presentation.dart';
import 'package:flutter/material.dart';

class ClipboardHistory extends StatefulWidget {
  const ClipboardHistory({
    super.key,
    required this.clipboardItems,
  });

  final List<ClipboardItem> clipboardItems;

  @override
  State<ClipboardHistory> createState() => _ClipboardHistoryState();
}

class _ClipboardHistoryState extends State<ClipboardHistory> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _scrollController,
      thumbVisibility: true,
      trackVisibility: true,
      interactive: true,
      child: ListView.separated(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.md,
        ),
        itemCount: widget.clipboardItems.length,
        findChildIndexCallback: (key) {
          final valueKey = key as ValueKey<int>;

          final index = widget.clipboardItems.indexWhere(
            (item) => item.createdAt.millisecondsSinceEpoch == valueKey.value,
          );

          return index != -1 ? 2 * index : null;
        },
        separatorBuilder: (context, index) =>
            const SizedBox(height: AppSpacing.xxs),
        itemBuilder: (context, index) {
          final clipboardItem = widget.clipboardItems[index];

          return ClipboardEntryCard(
            key: ValueKey(clipboardItem.createdAt.millisecondsSinceEpoch),
            clipboardItem: clipboardItem,
          );
        },
      ),
    );
  }
}
