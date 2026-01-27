import 'package:flutter/material.dart';

@immutable
class AppTypographyTheme extends ThemeExtension<AppTypographyTheme> {
  const AppTypographyTheme({
    required this.body,
    required this.secondary,
    required this.tertiary,
    required this.monoBody,
    required this.keyHint,
    required this.emptyTitle,
    required this.emptyDescription,
    required this.hint,
  });

  final TextStyle body;
  final TextStyle secondary;
  final TextStyle tertiary;
  final TextStyle monoBody;
  final TextStyle keyHint;
  final TextStyle emptyTitle;
  final TextStyle emptyDescription;
  final TextStyle hint;

  @override
  AppTypographyTheme copyWith({
    TextStyle? body,
    TextStyle? secondary,
    TextStyle? tertiary,
    TextStyle? monoBody,
    TextStyle? keyHint,
    TextStyle? emptyTitle,
    TextStyle? emptyDescription,
    TextStyle? hint,
  }) {
    return AppTypographyTheme(
      body: body ?? this.body,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      monoBody: monoBody ?? this.monoBody,
      keyHint: keyHint ?? this.keyHint,
      emptyTitle: emptyTitle ?? this.emptyTitle,
      emptyDescription: emptyDescription ?? this.emptyDescription,
      hint: hint ?? this.hint,
    );
  }

  @override
  AppTypographyTheme lerp(
    ThemeExtension<AppTypographyTheme>? other,
    double t,
  ) {
    if (other is! AppTypographyTheme) return this;
    return AppTypographyTheme(
      body: TextStyle.lerp(body, other.body, t)!,
      secondary: TextStyle.lerp(secondary, other.secondary, t)!,
      tertiary: TextStyle.lerp(tertiary, other.tertiary, t)!,
      monoBody: TextStyle.lerp(monoBody, other.monoBody, t)!,
      keyHint: TextStyle.lerp(keyHint, other.keyHint, t)!,
      emptyTitle: TextStyle.lerp(emptyTitle, other.emptyTitle, t)!,
      emptyDescription: TextStyle.lerp(
        emptyDescription,
        other.emptyDescription,
        t,
      )!,
      hint: TextStyle.lerp(hint, other.hint, t)!,
    );
  }
}
