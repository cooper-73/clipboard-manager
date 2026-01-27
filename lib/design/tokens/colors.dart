import 'package:flutter/material.dart';

abstract class AppColors {
  // Brand
  static const primary = Color(0xFF135BEC);
  static const primaryHover = Color(0xE6135BEC);
  static const primaryContainer = Color(0x1A135BEC);

  // Backgrounds & surfaces
  static const background = Color(0xFF101622);
  static const surface = Color(0xFF1C2333);
  static const surfaceVariant = Color(0xFF111722);
  static const surfaceHover = Color(0xFF2A3449);

  // List items
  static const itemHover = Color(0x0DFFFFFF);
  static const itemSelected = Color(0x1A135BEC);
  static const itemSelectedBorder = Color(0x33135BEC);

  // Status
  static const success = Color(0xFF10B981);
  static const successContainer = Color(0x1A10B981);

  // Text
  static const textPrimary = Color(0xFFFFFFFF);
  static const textSecondary = Color(0xFF92A4C9);
  static const textTertiary = Color(0xFF5D6B82);
  static const textDisabled = Color(0xFF6B7280);

  // Borders / dividers
  static const outline = Color(0x1AFFFFFF);
  static const outlineVariant = Color(0x0DFFFFFF);
  static const outlineFocus = Color(0x80135BEC);

  // Keycaps
  static const keycapBackground = Color(0x0DFFFFFF);
  static const keycapOutline = Color(0x1AFFFFFF);

  // Empty state
  static const emptyIcon = Color(0xFF6B7280);
  static const emptyGlow = Color(0x33135BEC);

  // Header / footer
  static const chrome = Color(0xCC101622);
}
