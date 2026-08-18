import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../providers/todo_provider.dart';
import '../widgets/todo_tile.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Part 2-4 · Todos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            // read: a one-off action in a callback, same reasoning as
            // the counter buttons in Part 1.
            onPressed: () => context.read<ThemeProvider>().toggleTheme(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ---- Part 4: Selector -----------------------------------
            // Only rebuilds when the *derived int* (remaining count)
            // actually changes, not on every notifyListeners() call.
            // Toggling a todo from done->done-again, or editing title
            // text (if you add that later) would NOT rebuild this.
            Selector<TodoProvider, int>(
              selector: (_, provider) =>
                  provider.todos.where((t) => !t.isDone).length,
              builder: (context, remaining, child) {
                debugPrint('Header (Selector) rebuilt: remaining=$remaining');
                return Text(
                  '$remaining task${remaining == 1 ? '' : 's'} remaining',
                  style: Theme.of(context).textTheme.titleMedium,
                );
              },
            ),
            const SizedBox(height: 8),

            // ---- Part 3: Consumer2 combining two providers ----------
            Consumer2<TodoProvider, ThemeProvider>(
              builder: (context, todoProvider, themeProvider, child) {
                final left =
                    todoProvider.todos.where((t) => !t.isDone).length;
                final themeLabel = themeProvider.isDark ? 'dark' : 'light';
                return Text(
                  '$left tasks left, theme: $themeLabel',
                  style: Theme.of(context).textTheme.bodySmall,
                );
              },
            ),
            const SizedBox(height: 16),

            // ---- Add-todo row: read only, this is a callback --------
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'New task',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) {
                      context.read<TodoProvider>().addTodo(value);
                      controller.clear();
                    },
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.add_circle),
                  onPressed: () {
                    context.read<TodoProvider>().addTodo(controller.text);
                    controller.clear();
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),

            // ---- Part 2: Consumer for the list -----------------------
            // context.watch<TodoProvider>() would also work here; a
            // Consumer is used so the rebuild scope is explicit and
            // visible in the widget tree.
            Expanded(
              child: Consumer<TodoProvider>(
                builder: (context, todoProvider, child) {
                  final todos = todoProvider.todos;
                  if (todos.isEmpty) {
                    return const Center(child: Text('No tasks yet'));
                  }
                  return ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) =>
                        TodoTile(todo: todos[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
