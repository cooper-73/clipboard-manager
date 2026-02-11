import 'package:clipboard_manager/design/design.dart';
import 'package:flutter/material.dart';

class CopyButton extends StatefulWidget {
  const CopyButton({
    super.key,
    required this.onTap,
  });

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
                  color: isHovered
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
                  const Icon(
                    Icons.copy_rounded,
                    size: AppTypography.lg,
                    color: Colors.white,
                  ),
                  Text(
                    'Copy',
                    style: context.typography.hint.copyWith(
                      color: Colors.white,
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
