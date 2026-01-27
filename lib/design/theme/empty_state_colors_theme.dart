import 'package:flutter/material.dart';

@immutable
class AppEmptyStateColorsTheme
    extends ThemeExtension<AppEmptyStateColorsTheme> {
  const AppEmptyStateColorsTheme({
    required this.emptyIcon,
    required this.emptyGlow,
  });

  final Color emptyIcon;
  final Color emptyGlow;

  @override
  ThemeExtension<AppEmptyStateColorsTheme> copyWith({
    Color? emptyIcon,
    Color? emptyGlow,
  }) {
    return AppEmptyStateColorsTheme(
      emptyIcon: emptyIcon ?? this.emptyIcon,
      emptyGlow: emptyGlow ?? this.emptyGlow,
    );
  }

  @override
  ThemeExtension<AppEmptyStateColorsTheme> lerp(
    ThemeExtension<AppEmptyStateColorsTheme>? other,
    double t,
  ) {
    if (other is! AppEmptyStateColorsTheme) return this;
    return AppEmptyStateColorsTheme(
      emptyIcon: Color.lerp(emptyIcon, other.emptyIcon, t)!,
      emptyGlow: Color.lerp(emptyGlow, other.emptyGlow, t)!,
    );
  }
}
