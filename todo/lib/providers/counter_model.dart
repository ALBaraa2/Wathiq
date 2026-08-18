import 'package:flutter/foundation.dart';

/// Part 1: the simplest possible ChangeNotifier.
///
/// The private `_count` + public getter pattern is used from the very
/// start so the habit is already in place before Part 2 introduces a
/// list, where the same pattern matters a lot more.
class CounterModel extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}
