import 'package:clipboard_manager/design/tokens/colors.dart';
import 'package:flutter/material.dart';

abstract class AppTypography {
  // Font families
  static const sans = 'Inter';
  static const mono = 'JetBrainsMono';

  // Sizes
  static const xs = 10.0;
  static const sm = 12.0;
  static const md = 14.0;
  static const lg = 16.0;
  static const xl = 24.0;

  /// Primary body text
  /// Used for: clipboard items, main content
  static const body = TextStyle(
    fontFamily: sans,
    fontSize: md,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.textPrimary,
  );

  /// Secondary / meta text
  /// Used for: timestamps, app source, subtitles
  static const secondary = TextStyle(
    fontFamily: sans,
    fontSize: sm,
    fontWeight: FontWeight.w400,
    height: 1,
    color: AppColors.textSecondary,
  );

  /// Tertiary / de-emphasized text
  /// Used for: placeholders, subtle hints
  static const tertiary = TextStyle(
    fontFamily: sans,
    fontSize: sm,
    fontWeight: FontWeight.w400,
    height: 1,
    color: AppColors.textTertiary,
  );

  /// Monospace text
  /// Used for: commands, hashes, code-like clipboard items
  static const monoBody = TextStyle(
    fontFamily: mono,
    fontSize: md,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.textPrimary,
  );

  /// Keyboard shortcut / key hint
  /// Used for: ⌘C, ↵, Esc
  static const keyHint = TextStyle(
    fontFamily: sans,
    fontSize: xs,
    fontWeight: FontWeight.w500,
    height: 1,
    color: AppColors.textTertiary,
  );

  /// Empty state title
  static const emptyTitle = TextStyle(
    fontFamily: sans,
    fontSize: xl,
    fontWeight: FontWeight.w700,
    height: 1.2,
    color: AppColors.textPrimary,
  );

  /// Empty state description
  static const emptyDescription = TextStyle(
    fontFamily: sans,
    fontSize: lg,
    fontWeight: FontWeight.w500,
    height: 1.2,
    color: AppColors.textSecondary,
  );

  /// Footer hints and microcopy
  static const hint = TextStyle(
    fontFamily: sans,
    fontSize: sm,
    fontWeight: FontWeight.w500,
    height: 1,
    color: AppColors.textDisabled,
  );
}
