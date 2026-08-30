import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/routes/routes_names.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../core/constant/app_icons.dart';
import '../../../../core/constant/images_path.dart';
import '../../../../core/constant/strings.dart';
import '../../../../core/widget/app_button.dart';
import '../../../../core/widget/input_field.dart';

class EmailRegisterScreen extends StatefulWidget {
  const EmailRegisterScreen({super.key});

  @override
  State<EmailRegisterScreen> createState() => _EmailRegisterScreenState();
}

class _EmailRegisterScreenState extends State<EmailRegisterScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.primary,
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        surfaceTintColor: AppColors.transparent,

        leading: IconButton(
          onPressed: () => Navigator.maybePop(context),
          icon: SvgPicture.asset(
            AppIcons.back,
          ),
        ),
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;

          final horizontalPadding =
          (screenWidth * 0.071).clamp(20.0, 32.0);

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
// Same gradient overlay as the onboarding screen
// -----------------------------------------------------------
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.black.withValues(alpha: 0.2),
                        AppColors.black.withValues(alpha: 0.60),
                        AppColors.backgroundGradient.withValues(alpha: 0.95),
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
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
// Space below the transparent AppBar.
                      const SizedBox(height: 48),

                      Text(
                        AppStrings.getStarted,
                        style: textTheme.headlineLarge?.copyWith(
                          color: AppColors.white,
                        ),
                      ),

                      const SizedBox(height: 16),

                      Text(
                        AppStrings.enterYourEmailAdd,
                        style: textTheme.bodyLarge?.copyWith(
                          color: AppColors.white,
                        ),
                      ),

                      const SizedBox(height: 24),

                      Text(
                        AppStrings.enterEmail,
                        style: textTheme.labelMedium?.copyWith(
                          color: AppColors.white,
                        ),
                      ),

                      const SizedBox(height: 12),

                      InputFieldWidget(
                        hint: AppStrings.emailHintText,
                        controller: _emailController,
                      ),

                      const SizedBox(height: 24),

                      SizedBox(
                        width: double.infinity,
                        child: AppElevatedButton(
                          text: AppStrings.sendCode,
                          onPressed: () {
// Email authentication
                          },
                          backgroundColor: AppColors.primary,
                          borderWidth: 1,
                          height: 58,
                          borderRadius: 9999,
                          postIcon: SvgPicture.asset(
                            AppIcons.send,
                          ),
                        ),
                      ),

                      const Spacer(),

                      Center(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                              AppStrings.alreadyHaveAccount,
                              textAlign: TextAlign.center,
                              style: textTheme.bodySmall?.copyWith(
                                color: AppColors.white.withValues(
                                  alpha: 0.47,
                                ),
                              ),
                            ),

                            TextButton(
                              onPressed: () {
                                context.go(
                                  RouteNames.onboardingLoginScreen,
                                );
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: AppColors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 4,
                                ),
                                minimumSize: Size.zero,
                                tapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                AppStrings.signIn,
                                style: textTheme.bodySmall?.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),
                    ],
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

