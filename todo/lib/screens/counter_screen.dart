import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/counter_model.dart';

/// Part 1 screen. Scoped on purpose: CounterModel is only needed here, so
/// it's provided locally with ChangeNotifierProvider instead of being
/// dumped into the app-wide MultiProvider in main.dart. This is the
/// "provide as close to where it's used as possible" convention.
class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterModel(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Part 1 · Counter')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Consumer scopes the rebuild to just this Text widget.
              Consumer<CounterModel>(
                builder: (context, model, child) {
                  return Text(
                    '${model.count}',
                    style: Theme.of(context).textTheme.displayMedium,
                  );
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: 'dec',
                    // read: we only need to call a method once, not
                    // subscribe this button to rebuilds.
                    onPressed: () => context.read<CounterModel>().decrement(),
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(width: 16),
                  FloatingActionButton(
                    heroTag: 'inc',
                    onPressed: () => context.read<CounterModel>().increment(),
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
