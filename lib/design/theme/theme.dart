import 'package:clipboard_manager/design/theme/colors_theme.dart';
import 'package:clipboard_manager/design/theme/typography_theme.dart';
import 'package:clipboard_manager/design/tokens/tokens.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData buildAppTheme() {
    return ThemeData(
      useMaterial3: false,
      extensions: const [
        AppColorsTheme(
          background: AppColors.background,
          surface: AppColors.surface,
          surfaceHover: AppColors.surfaceHover,
          primary: AppColors.primary,
          success: AppColors.success,
          textPrimary: AppColors.textPrimary,
          textSecondary: AppColors.textSecondary,
          textTertiary: AppColors.textTertiary,
          textDisabled: AppColors.textDisabled,
          outline: AppColors.outline,
          outlineFocus: AppColors.outlineFocus,
        ),
        AppTypographyTheme(
          body: AppTypography.body,
          secondary: AppTypography.secondary,
          tertiary: AppTypography.tertiary,
          monoBody: AppTypography.monoBody,
          keyHint: AppTypography.keyHint,
          emptyTitle: AppTypography.emptyTitle,
          emptyDescription: AppTypography.emptyDescription,
          hint: AppTypography.hint,
        ),
      ],
    );
  }
}

extension ThemeX on BuildContext {
  AppColorsTheme get colors => Theme.of(this).extension<AppColorsTheme>()!;

  AppTypographyTheme get typography =>
      Theme.of(this).extension<AppTypographyTheme>()!;
}
