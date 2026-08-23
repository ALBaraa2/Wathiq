import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/config/routes/routes_names.dart';


import '../../features/auth/presentation/pages/email_login_screen.dart';
import '../../features/auth/presentation/pages/email_registe_screen.dart';
import '../../features/auth/presentation/pages/phone_login_screen.dart';
import '../../features/auth/presentation/pages/phone_register_screen.dart';
import '../../features/onboarding/presentation/onboardin_screen.dart';
import '../../features/onboarding/presentation/onboarding_login_screen.dart';
import '../../features/onboarding/presentation/splash_screen.dart';

class AppRoutes {
  AppRoutes._();

  // ─────────────────────────────────────────────
  // Router
  // ─────────────────────────────────────────────

  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.onboardingScreen,

    routes: [
      // ─────────────────────────────────────────────
      // Splash
      // ─────────────────────────────────────────────

      GoRoute(
        path: RouteNames.splash,
        name: 'splash',
        builder: (context, state) {
          return const SplashScreen();
        },
      ),

      // ─────────────────────────────────────────────
      // Onboarding
      // ─────────────────────────────────────────────

      GoRoute(
        path: RouteNames.onboardingScreen,
        name: 'onboardingScreen',
        builder: (context, state) {
          return const OnBoardingScreen();
        },
      ),

      GoRoute(
        path: RouteNames.onboardingLoginScreen,
        name: 'onboardingLoginScreen',
        builder: (context, state) {
          return const OnBoardingLoginScreen();
        },
      ),

      // ─────────────────────────────────────────────
      // Login
      // ─────────────────────────────────────────────

      GoRoute(
        path: RouteNames.phoneLoginScreen,
        name: 'phoneLoginScreen',
        builder: (context, state) {
          return const PhoneLoginScreen();
        },
      ),

      GoRoute(
        path: RouteNames.emailLoginScreen,
        name: 'emailLoginScreen',
        builder: (context, state) {
          return const EmailLoginScreen();
        },
      ),

      // ─────────────────────────────────────────────
      // Register
      // ─────────────────────────────────────────────

      GoRoute(
        path: RouteNames.phoneRegisterScreen,
        name: 'phoneRegisterScreen',
        builder: (context, state) {
          return const PhoneRegisterScreen();
        },
      ),

      GoRoute(
        path: RouteNames.emailRegisterScreen,
        name: 'emailRegisterScreen',
        builder: (context, state) {
          return const EmailRegisterScreen();
        },
      ),

      // ─────────────────────────────────────────────
      // Splash
      // ─────────────────────────────────────────────


    ],
  );
}