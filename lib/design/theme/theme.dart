import 'package:clipboard_manager/design/theme/colors_theme.dart';
import 'package:clipboard_manager/design/theme/empty_state_colors_theme.dart';
import 'package:clipboard_manager/design/theme/keycap_colors_theme.dart';
import 'package:clipboard_manager/design/theme/list_colors_theme.dart';
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
          surfaceVariant: AppColors.surfaceVariant,
          surfaceHover: AppColors.surfaceHover,
          primary: AppColors.primary,
          primaryHover: AppColors.primaryHover,
          primaryContainer: AppColors.primaryContainer,
          success: AppColors.success,
          successContainer: AppColors.successContainer,
          textPrimary: AppColors.textPrimary,
          textSecondary: AppColors.textSecondary,
          textTertiary: AppColors.textTertiary,
          textDisabled: AppColors.textDisabled,
          outline: AppColors.outline,
          outlineVariant: AppColors.outlineVariant,
          outlineFocus: AppColors.outlineFocus,
        ),
        AppListColorsTheme(
          itemHover: AppColors.itemHover,
          itemSelected: AppColors.itemSelected,
          itemSelectedBorder: AppColors.itemSelectedBorder,
        ),
        AppKeycapColorsTheme(
          keycapBackground: AppColors.keycapBackground,
          keycapOutline: AppColors.keycapOutline,
        ),
        AppEmptyStateColorsTheme(
          emptyIcon: AppColors.emptyIcon,
          emptyGlow: AppColors.emptyGlow,
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

  AppListColorsTheme get listColors =>
      Theme.of(this).extension<AppListColorsTheme>()!;

  AppKeycapColorsTheme get keycapColors =>
      Theme.of(this).extension<AppKeycapColorsTheme>()!;

  AppEmptyStateColorsTheme get emptyStateColors =>
      Theme.of(this).extension<AppEmptyStateColorsTheme>()!;

  AppTypographyTheme get typography =>
      Theme.of(this).extension<AppTypographyTheme>()!;
}
