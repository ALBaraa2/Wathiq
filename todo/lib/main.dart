import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';
import 'providers/todo_provider.dart';
import 'screens/counter_screen.dart';
import 'screens/todo_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Part 3: MultiProvider at the root. TodoProvider and ThemeProvider
    // are app-wide because more than one screen/widget needs them.
    // CounterModel is NOT listed here — it's scoped to CounterScreen
    // instead (see counter_screen.dart) since nothing else needs it.
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      // A Consumer here reads ThemeProvider to pick light/dark ThemeData.
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Provider Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.light,
              colorSchemeSeed: Colors.indigo,
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              colorSchemeSeed: Colors.indigo,
              useMaterial3: true,
            ),
            themeMode: themeProvider.isDark ? ThemeMode.dark : ThemeMode.light,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Provider Learning App')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CounterScreen()),
              ),
              child: const Text('Part 1 · Counter'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TodoScreen()),
              ),
              child: const Text('Part 2-4 · Todos'),
            ),
          ],
        ),
      ),
    );
  }
}
