import 'package:flutter/foundation.dart';
import '../models/todo.dart';

/// Part 2: managing a collection instead of a primitive.
///
/// `_todos` is private. Every read of the list goes through the [todos]
/// getter, and every write goes through addTodo/toggleTodo/removeTodo.
/// That's the whole point of the exercise — see the README for the
/// checkpoint answer on *why* this matters.
class TodoProvider extends ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => List.unmodifiable(_todos);

  void addTodo(String title) {
    final trimmed = title.trim();
    if (trimmed.isEmpty) return;
    _todos.add(
      Todo(id: DateTime.now().microsecondsSinceEpoch.toString(), title: trimmed),
    );
    notifyListeners();
  }

  void toggleTodo(String id) {
    final index = _todos.indexWhere((t) => t.id == id);
    if (index == -1) return;
    _todos[index] = _todos[index].copyWith(isDone: !_todos[index].isDone);
    notifyListeners();
  }

  void removeTodo(String id) {
    _todos.removeWhere((t) => t.id == id);
    notifyListeners();
  }
}
