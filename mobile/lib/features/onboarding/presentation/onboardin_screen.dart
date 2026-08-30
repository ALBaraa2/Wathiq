import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../config/routes/routes_names.dart';
import '../../../config/theme/app_colors.dart';
import '../../../core/constant/app_icons.dart';
import '../../../core/constant/images_path.dart';
import '../../../core/constant/strings.dart';
import '../../../core/widget/app_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;

// Figma reference:
// 393px screen width
// 28px approximately on each side for 337px content width.
//
// Responsive rule:
// - proportional on normal screens
// - never smaller than 20px
// - never larger than 32px
          final horizontalPadding =
          (screenWidth * 0.071).clamp(20.0, 32.0);

// The Figma vertical design is around a bottom-oriented
// content composition. This spacing scales a little with
// screen height but is bounded to avoid extreme values.
          final textToActionsGap =
          (screenHeight * 0.056).clamp(28.0, 48.0);

          return Stack(
            fit: StackFit.expand,
            children: [
// -----------------------------------------------------------
// Background image
// -----------------------------------------------------------
              Positioned.fill(
                child: Image.asset(
                  ImagePath.background,
                  fit: BoxFit.cover,
                ),
              ),

// -----------------------------------------------------------
// Figma-like gradient overlay
// -----------------------------------------------------------
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.black.withValues(alpha: 0.20),
                        AppColors.black.withValues(alpha: 0.60),
                        AppColors.primary.withValues(alpha: 0.95),
                      ],
                      stops: const [
                        0.0,
                        0.40,
                        1.0,
                      ],
                    ),
                  ),
                ),
              ),

// -----------------------------------------------------------
// Main content
// -----------------------------------------------------------
              SafeArea(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 420,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                // -------------------------------------------------
                // Give the bottom layout a little breathing room.
                // -------------------------------------------------
                            const SizedBox(height: 222),

                // -------------------------------------------------
                // Text section
                // -------------------------------------------------
                            _OnboardingTextContent(
                              textTheme: textTheme,
                            ),

                            // SizedBox(
                            //   height: textToActionsGap,
                            // ),
                            SizedBox(height: 100,),

                // -------------------------------------------------
                // Action buttons
                // -------------------------------------------------
                            const _ActionButtons(),

                // -------------------------------------------------
                // Footer
                // -------------------------------------------------
                            const SizedBox(height:41),

                            const _LoginRow(),

                // Bottom breathing room.
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ===========================================================================
// Text Content
// ===========================================================================

class _OnboardingTextContent extends StatelessWidget {
  const _OnboardingTextContent({
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
// Figma:
// Width  ≈ 307px
// Font   = 36px
// Line   = 45px
//
// We constrain the width instead of hardcoding the width.
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 340,
          ),
          child: Text(
            AppStrings.onboardingTitle,
            textAlign: TextAlign.center,
            style: textTheme.headlineLarge?.copyWith(
              color: AppColors.white,
              fontSize: 36,
              height: 45 / 36,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.9,
            ),
          ),
        ),

        const SizedBox(height: 16),

// Figma:
// Font size = 18px
// Line height = 28px
//
// Do not force the widget itself to 28px height.
// Let Text determine its own height.
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 320,
          ),
          child: Text(
            AppStrings.onboardingSubtitle,
            textAlign: TextAlign.center,
            style: textTheme.bodyLarge?.copyWith(
              color: AppColors.secondary,
              fontSize: 18,
              height: 28 / 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

// ===========================================================================
// Action Buttons
// ===========================================================================

class _ActionButtons extends StatelessWidget {
  const _ActionButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _EmailButton(),
        const SizedBox(height: 16),
        const _PhoneButton(),
      ],
    );
  }
}

// ===========================================================================
// Email Button
// ===========================================================================

class _EmailButton extends StatelessWidget {
  const _EmailButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AppElevatedButton(
        text: AppStrings.continueWithEmail,
        onPressed: () {
          context.go(RouteNames.emailRegisterScreen);
        },
        backgroundColor: AppColors.white,
        enableBorder: false,
        height: 58,
        borderRadius: 9999,
        preIcon: SvgPicture.asset(
          AppIcons.gmail,
          width: 20,
          height: 20,
          excludeFromSemantics: true,
        ),
        textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 16,
          height: 24 / 16,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}

// ===========================================================================
// Phone Button
// ===========================================================================

class _PhoneButton extends StatelessWidget {
  const _PhoneButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AppElevatedButton(
        text: AppStrings.continueWithPhone,
        onPressed: () {
          context.go(RouteNames.phoneRegisterScreen);
        },
        backgroundColor: AppColors.transparent,
        enableBorder: true,
        borderColor: AppColors.border.withValues(alpha: 0.5),
        height: 58,
        borderRadius: 9999,
        preIcon: SvgPicture.asset(
          AppIcons.phone,
          width: 24,
          height: 24,
          excludeFromSemantics: true,
        ),
        textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 16,
          height: 24 / 16,
          fontWeight: FontWeight.w500,
          color: AppColors.white,
        ),
      ),
    );
  }
}

// ===========================================================================
// Login Footer
// ===========================================================================

class _LoginRow extends StatelessWidget {
  const _LoginRow();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            AppStrings.alreadyHaveAccount,
            textAlign: TextAlign.center,
            style: textTheme.bodySmall?.copyWith(
              color: AppColors.white.withValues(alpha: 0.47),
              fontSize: 14,
              height: 20 / 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextButton(
            onPressed: () {
              context.go(RouteNames.onboardingLoginScreen);
            },
            style: TextButton.styleFrom(
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 4,
              ),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              AppStrings.signIn,
              style: textTheme.bodySmall?.copyWith(
                color: AppColors.white,
                fontSize: 14,
                height: 20 / 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
