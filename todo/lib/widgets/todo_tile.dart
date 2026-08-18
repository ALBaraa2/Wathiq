import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/todo.dart';
import '../providers/todo_provider.dart';

/// A single row. It takes a plain [Todo] value (not a watched provider),
/// so it only rebuilds when the ListView.builder above it rebuilds and
/// passes it a new Todo instance. The debug print here is what Part 4
/// asks you to compare against the header's print.
class TodoTile extends StatelessWidget {
  final Todo todo;
  const TodoTile({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    debugPrint('TodoTile rebuilt: "${todo.title}"');
    return ListTile(
      leading: Checkbox(
        value: todo.isDone,
        onChanged: (_) => context.read<TodoProvider>().toggleTodo(todo.id),
      ),
      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        onPressed: () => context.read<TodoProvider>().removeTodo(todo.id),
      ),
    );
  }
}
