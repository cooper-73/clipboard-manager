import 'package:clipboard_manager/design/tokens/tokens.dart';
import 'package:flutter/material.dart';

abstract class AppShadows {
  static final window = BoxShadow(
    color: Colors.black.withValues(alpha: 0.35),
    blurRadius: 40,
    offset: const Offset(0, 20),
  );

  static final primary = BoxShadow(
    color: AppColors.primary.withValues(alpha: 0.2),
    blurRadius: 12,
  );
}
