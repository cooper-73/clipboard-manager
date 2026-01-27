import 'package:flutter/material.dart';

@immutable
class AppListColorsTheme extends ThemeExtension<AppListColorsTheme> {
  const AppListColorsTheme({
    required this.itemHover,
    required this.itemSelected,
    required this.itemSelectedBorder,
  });

  final Color itemHover;
  final Color itemSelected;
  final Color itemSelectedBorder;

  @override
  ThemeExtension<AppListColorsTheme> copyWith({
    Color? itemHover,
    Color? itemSelected,
    Color? itemSelectedBorder,
  }) {
    return AppListColorsTheme(
      itemHover: itemHover ?? this.itemHover,
      itemSelected: itemSelected ?? this.itemSelected,
      itemSelectedBorder: itemSelectedBorder ?? this.itemSelectedBorder,
    );
  }

  @override
  ThemeExtension<AppListColorsTheme> lerp(
    ThemeExtension<AppListColorsTheme>? other,
    double t,
  ) {
    if (other is! AppListColorsTheme) return this;
    return AppListColorsTheme(
      itemHover: Color.lerp(itemHover, other.itemHover, t)!,
      itemSelected: Color.lerp(itemSelected, other.itemSelected, t)!,
      itemSelectedBorder: Color.lerp(
        itemSelectedBorder,
        other.itemSelectedBorder,
        t,
      )!,
    );
  }
}
