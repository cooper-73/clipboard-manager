import 'package:flutter/material.dart';

@immutable
class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  const AppColorsTheme({
    required this.background,
    required this.surface,
    required this.surfaceVariant,
    required this.surfaceHover,
    required this.primary,
    required this.primaryHover,
    required this.primaryContainer,
    required this.success,
    required this.successContainer,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textDisabled,
    required this.outline,
    required this.outlineVariant,
    required this.outlineFocus,
  });

  final Color background;
  final Color surface;
  final Color surfaceVariant;
  final Color surfaceHover;
  final Color primary;
  final Color primaryHover;
  final Color primaryContainer;
  final Color success;
  final Color successContainer;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textDisabled;
  final Color outline;
  final Color outlineVariant;
  final Color outlineFocus;

  @override
  AppColorsTheme copyWith({
    Color? background,
    Color? surface,
    Color? surfaceVariant,
    Color? surfaceHover,
    Color? primary,
    Color? primaryHover,
    Color? primaryContainer,
    Color? success,
    Color? successContainer,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textDisabled,
    Color? outline,
    Color? outlineVariant,
    Color? outlineFocus,
  }) {
    return AppColorsTheme(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      surfaceHover: surfaceHover ?? this.surfaceHover,
      primary: primary ?? this.primary,
      primaryHover: primaryHover ?? this.primaryHover,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      success: success ?? this.success,
      successContainer: successContainer ?? this.successContainer,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      textDisabled: textDisabled ?? this.textDisabled,
      outline: outline ?? this.outline,
      outlineVariant: outlineVariant ?? this.outlineVariant,
      outlineFocus: outlineFocus ?? this.outlineFocus,
    );
  }

  @override
  AppColorsTheme lerp(
    ThemeExtension<AppColorsTheme>? other,
    double t,
  ) {
    if (other is! AppColorsTheme) return this;
    return AppColorsTheme(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceVariant: Color.lerp(surfaceVariant, other.surfaceVariant, t)!,
      surfaceHover: Color.lerp(surfaceHover, other.surfaceHover, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      primaryHover: Color.lerp(primaryHover, other.primaryHover, t)!,
      primaryContainer: Color.lerp(
        primaryContainer,
        other.primaryContainer,
        t,
      )!,
      success: Color.lerp(success, other.success, t)!,
      successContainer: Color.lerp(
        successContainer,
        other.successContainer,
        t,
      )!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      outline: Color.lerp(outline, other.outline, t)!,
      outlineVariant: Color.lerp(outlineVariant, other.outlineVariant, t)!,
      outlineFocus: Color.lerp(outlineFocus, other.outlineFocus, t)!,
    );
  }
}
