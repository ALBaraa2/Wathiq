import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../config/routes/routes_names.dart';
import '../../../config/theme/app_colors.dart';
import '../../../core/constant/app_icons.dart';
import '../../../core/constant/images_path.dart';
import '../../../core/widget/app_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(ImagePath.background, fit: BoxFit.cover),
          ),

          // Optional dark overlay for better text readability
          Positioned.fill(
            child: Container(color: AppColors.black.withValues(alpha: 0.25)),
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Find Your Dream \nHome on the Go",
                    style: textTheme.headlineLarge?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 16),

                  Text(
                    "Scroll, Select, and Let's Settle In!",
                    style: textTheme.bodyLarge?.copyWith(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 90),

                  // Continue With Email
                  AppElevatedButton(
                    text: 'Continue with Email',
                    onPressed: () {
                      context.go(RouteNames.emailRegisterScreen);
                    },
                    backgroundColor: AppColors.white,
                    enableBorder: true,
                    borderColor: AppColors.border,
                    borderWidth: 1,
                    height: 58,
                    borderRadius: 9999,
                    preIcon: SvgPicture.asset(
                      AppIcons.gmail,
                      width: 24,
                      height: 24,
                    ),

                    textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Continue With Phone
                  AppElevatedButton(
                    text: ' With Phone Number',
                    onPressed: () {
                       context.go(RouteNames.phoneRegisterScreen);
                    },
                    backgroundColor: AppColors.primary,
                    enableBorder: false,
                    height: 56,
                    borderRadius: 9999,
                    preIcon: SvgPicture.asset(
                      AppIcons.phone,
                      width: 24,
                      height: 24,
                    ),
                    textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Login Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: textTheme.bodySmall?.copyWith(
                          color: AppColors.white.withValues(alpha: 0.7),
                        ),
                      ),

                      TextButton(
                        onPressed: () {
                          context.go(RouteNames.onboardingLoginScreen);
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.white,
                        ),
                        child: const Text("Sign in"),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
