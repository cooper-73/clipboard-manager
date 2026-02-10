import 'package:clipboard_manager/design/design.dart';
import 'package:flutter/material.dart';

class ClipboardBadge extends StatelessWidget {
  const ClipboardBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.square(
          dimension: AppMetrics.emptyIconSize,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: context.colors.surfaceVariant,
              shape: BoxShape.circle,
              border: Border.all(
                color: context.colors.outline,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
            child: Icon(
              Icons.assignment_outlined,
              size: 3 * AppTypography.xl,
              color: context.emptyStateColors.emptyIcon,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: SizedBox.square(
            dimension: AppMetrics.emptyBadgeSize,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: context.colors.primary,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 4,
                  color: context.colors.surfaceVariant,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              ),
              child: Icon(
                Icons.add_rounded,
                size: AppTypography.xl,
                color: context.colors.textPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
