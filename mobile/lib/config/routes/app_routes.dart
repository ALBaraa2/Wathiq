import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/login_screen.dart';
import '../../features/onboarding/presentation/splash_screen.dart';

class AppRoutes {
  AppRoutes._();

  // ─────────────────────────────────────────────
  // Route Names
  // ─────────────────────────────────────────────

  static const String splash = '/';

  static const String login = '/login';

  // ─────────────────────────────────────────────
  // Router
  // ─────────────────────────────────────────────

  static final GoRouter router = GoRouter(
    initialLocation: splash,

    routes: [
      GoRoute(
        path: splash,
        name: 'splash',
        builder: (context, state) {
          return const SplashScreen();
        },
      ),

      GoRoute(
        path: login,
        name: 'login',
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
    ],
  );
}