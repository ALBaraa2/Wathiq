/// Plain, immutable data class. It holds no logic and knows nothing about
/// Provider — that separation is what keeps the model reusable and easy
/// to test in isolation.
class Todo {
  final String id;
  final String title;
  final bool isDone;

  const Todo({
    required this.id,
    required this.title,
    this.isDone = false,
  });

  /// Returns a new Todo with the given fields replaced. Since the class is
  /// immutable, this is the only way to "change" a todo — the provider
  /// swaps the old instance for a new one rather than mutating in place.
  Todo copyWith({String? title, bool? isDone}) {
    return Todo(
      id: id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }
}
