import 'package:clipboard_manager/design/design.dart';
import 'package:flutter/material.dart';

class CopyButton extends StatefulWidget {
  const CopyButton({
    super.key,
    required this.isCopied,
    required this.onTap,
  });

  final bool isCopied;
  final VoidCallback onTap;

  @override
  State<CopyButton> createState() => CopyButtonState();
}

class CopyButtonState extends State<CopyButton> {
  final _isHovered = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _isHovered.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _isHovered.value = true,
      onExit: (_) => _isHovered.value = false,
      child: GestureDetector(
        onTap: widget.onTap,
        child: SizedBox(
          height: AppSpacing.xxl,
          child: ValueListenableBuilder(
            valueListenable: _isHovered,
            builder: (_, isHovered, child) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: widget.isCopied
                      ? context.colors.success.withValues(alpha: 0.2)
                      : isHovered
                      ? context.colors.primary.withValues(alpha: 0.9)
                      : context.colors.primary,
                  borderRadius: const BorderRadius.all(AppRadius.sm),
                ),
                child: child,
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
              ),
              child: Row(
                spacing: AppSpacing.xs,
                children: [
                  Icon(
                    widget.isCopied ? Icons.check_circle : Icons.copy_rounded,
                    size: AppTypography.lg,
                    color: widget.isCopied
                        ? context.colors.success
                        : Colors.white,
                  ),
                  Text(
                    widget.isCopied ? 'Copied!' : 'Copy',
                    style: context.typography.hint.copyWith(
                      fontWeight: FontWeight.w600,
                      color: widget.isCopied
                          ? context.colors.success
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
