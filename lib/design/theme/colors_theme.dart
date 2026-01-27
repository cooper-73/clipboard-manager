import 'package:flutter/material.dart';

@immutable
class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  const AppColorsTheme({
    required this.background,
    required this.surface,
    required this.surfaceHover,
    required this.primary,
    required this.success,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textDisabled,
    required this.outline,
    required this.outlineFocus,
  });

  final Color background;
  final Color surface;
  final Color surfaceHover;
  final Color primary;
  final Color success;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textDisabled;
  final Color outline;
  final Color outlineFocus;

  @override
  AppColorsTheme copyWith({
    Color? background,
    Color? surface,
    Color? surfaceHover,
    Color? primary,
    Color? success,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textDisabled,
    Color? outline,
    Color? outlineFocus,
  }) {
    return AppColorsTheme(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceHover: surfaceHover ?? this.surfaceHover,
      primary: primary ?? this.primary,
      success: success ?? this.success,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      textDisabled: textDisabled ?? this.textDisabled,
      outline: outline ?? this.outline,
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
      surfaceHover: Color.lerp(surfaceHover, other.surfaceHover, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      success: Color.lerp(success, other.success, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      outline: Color.lerp(outline, other.outline, t)!,
      outlineFocus: Color.lerp(outlineFocus, other.outlineFocus, t)!,
    );
  }
}
