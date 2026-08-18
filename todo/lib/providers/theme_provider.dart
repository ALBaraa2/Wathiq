import 'package:flutter/foundation.dart';

/// Part 3: a second, completely independent provider. It knows nothing
/// about TodoProvider — MultiProvider is what brings the two together at
/// the widget-tree level, not any coupling between the classes themselves.
class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
