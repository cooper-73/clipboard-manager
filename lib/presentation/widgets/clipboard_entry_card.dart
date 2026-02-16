import 'package:clipboard_manager/core/core.dart';
import 'package:clipboard_manager/design/design.dart';
import 'package:clipboard_manager/domain/domain.dart';
import 'package:clipboard_manager/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClipboardEntryCard extends StatefulWidget {
  const ClipboardEntryCard({
    super.key,
    required this.clipboardItem,
  });

  final ClipboardItem clipboardItem;

  @override
  State<ClipboardEntryCard> createState() => _ClipboardEntryCardState();
}

class _ClipboardEntryCardState extends State<ClipboardEntryCard> {
  final _isHovered = ValueNotifier<bool>(false);
  final _isCopied = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _isHovered.dispose();
    _isCopied.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _isHovered.value = true,
      onExit: (_) => _isHovered.value = false,
      child: ValueListenableBuilder(
        valueListenable: _isHovered,
        builder: (_, isHovered, __) {
          return ValueListenableBuilder(
            valueListenable: _isCopied,
            builder: (context, isCopied, child) {
              return _ClipboardEntryContent(
                clipboardItem: widget.clipboardItem,
                isSelected: isHovered,
                isHovered: isHovered,
                isCopied: isCopied,
                onCopyItem: () {
                  context.read<ClipboardNotifier>().copyItem(
                    widget.clipboardItem.value,
                  );

                  _isCopied.value = true;

                  Future.delayed(const Duration(seconds: 1), () {
                    _isCopied.value = false;
                  });
                },
              );
            },
          );
        },
      ),
    );
  }
}

class _ClipboardEntryContent extends StatelessWidget {
  const _ClipboardEntryContent({
    required this.clipboardItem,
    required this.isSelected,
    required this.isHovered,
    required this.isCopied,
    required this.onCopyItem,
  });

  final ClipboardItem clipboardItem;
  final bool isSelected;
  final bool isHovered;
  final bool isCopied;
  final VoidCallback onCopyItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: isCopied
            ? context.colors.successContainer
            : isSelected
            ? context.listColors.itemSelected
            : isHovered
            ? context.listColors.itemHover
            : Colors.transparent,
        borderRadius: const BorderRadius.all(AppRadius.md),
        border: Border.all(
          color: isCopied
              ? context.colors.success.withValues(alpha: 0.2)
              : isSelected
              ? context.listColors.itemSelectedBorder
              : Colors.transparent,
        ),
      ),
      child: Row(
        spacing: AppSpacing.md,
        children: [
          SizedBox.square(
            dimension: 36,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: context.colors.surface,
                borderRadius: const BorderRadius.all(AppRadius.sm),
                border: Border.all(color: context.colors.outlineVariant),
              ),
              child: Icon(
                Icons.description_outlined,
                size: 20,
                color: isCopied
                    ? context.colors.success
                    : isHovered
                    ? Colors.white
                    : context.colors.textSecondary,
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
                  style: context.typography.body.copyWith(
                    color: isCopied || isHovered ? Colors.white : null,
                  ),
                ),
                Row(
                  spacing: AppSpacing.sm,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: isCopied
                            ? Colors.white.withValues(alpha: 0.05)
                            : isSelected
                            ? context.colors.primary.withValues(alpha: 0.1)
                            : Colors.transparent,
                        borderRadius: const BorderRadius.all(AppRadius.xs),
                        border: Border.all(
                          color: isCopied || isSelected
                              ? Colors.transparent
                              : context.colors.outlineVariant,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.xs,
                          vertical: AppSpacing.xxs,
                        ),
                        child: Text(
                          'Text',
                          style: context.typography.keyHint.copyWith(
                            color: isCopied
                                ? context.colors.textSecondary
                                : isHovered
                                ? context.colors.primary
                                : null,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      clipboardItem.createdAt.timeAgo,
                      style: isCopied || isHovered
                          ? context.typography.secondary
                          : context.typography.tertiary,
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (isHovered && !isCopied)
            Text(
              'Press ↵',
              style: context.typography.tertiary,
            ),
          if (isCopied || isSelected)
            CopyButton(
              isCopied: isCopied,
              onTap: onCopyItem,
            ),
        ],
      ),
    );
  }
}
