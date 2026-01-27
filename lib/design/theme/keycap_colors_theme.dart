import 'package:flutter/material.dart';

@immutable
class AppKeycapColorsTheme extends ThemeExtension<AppKeycapColorsTheme> {
  const AppKeycapColorsTheme({
    required this.keycapBackground,
    required this.keycapOutline,
  });

  final Color keycapBackground;
  final Color keycapOutline;

  @override
  ThemeExtension<AppKeycapColorsTheme> copyWith({
    Color? keycapBackground,
    Color? keycapOutline,
  }) {
    return AppKeycapColorsTheme(
      keycapBackground: keycapBackground ?? this.keycapBackground,
      keycapOutline: keycapOutline ?? this.keycapOutline,
    );
  }

  @override
  ThemeExtension<AppKeycapColorsTheme> lerp(
    ThemeExtension<AppKeycapColorsTheme>? other,
    double t,
  ) {
    if (other is! AppKeycapColorsTheme) return this;
    return AppKeycapColorsTheme(
      keycapBackground: Color.lerp(
        keycapBackground,
        other.keycapBackground,
        t,
      )!,
      keycapOutline: Color.lerp(keycapOutline, other.keycapOutline, t)!,
    );
  }
}
