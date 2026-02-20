import 'dart:ui';

abstract class AppMetrics {
  // Window
  static const windowInitialSize = Size(720, 560);
  static const windowMinSize = Size(560, 420);
  static const windowMaxSize = Size(900, 720);

  // Content
  static const contentMinWidth = 640.0;
  static const contentMaxWidth = 820.0;

  // Search
  static const searchFieldHeight = 48.0;
  static const searchIconSize = 22.0;

  // List items
  static const listItemHeight = 52.0;
  static const listItemIconSize = 20.0;

  // Window chrome
  static const titleBarHeight = 48.0;
  static const statusBarHeight = 32.0;

  // Empty illustration
  static const emptyIconSize = 128.0;
  static const emptyBadgeSize = 40.0;
}
