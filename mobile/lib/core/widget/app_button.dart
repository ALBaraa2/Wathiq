import 'package:flutter/material.dart';

import '../../config/theme/app_colors.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.enabled = true,
    this.enableBorder = false,
    this.borderColor,
    this.borderWidth = 1,
    this.preIcon,
    this.postIcon,
    this.width,
    this.height,
    this.borderRadius,
    this.iconGap = 11,
    this.textStyle,
    this.elevation,
    this.disabledBackgroundColor,
    this.disabledTextColor,
  });

  // ─────────────────────────────────────────────
  // Required
  // ─────────────────────────────────────────────

  final String text;
  final VoidCallback? onPressed;

  // ─────────────────────────────────────────────
  // State
  // ─────────────────────────────────────────────

  final bool enabled;

  // ─────────────────────────────────────────────
  // Colors
  // ─────────────────────────────────────────────

  final Color? backgroundColor;
  final Color? disabledBackgroundColor;
  final Color? disabledTextColor;

  // ─────────────────────────────────────────────
  // Border
  // ─────────────────────────────────────────────

  final bool enableBorder;
  final Color? borderColor;
  final double borderWidth;

  // ─────────────────────────────────────────────
  // Icons
  // ─────────────────────────────────────────────

  final Widget? preIcon;
  final Widget? postIcon;

  // ─────────────────────────────────────────────
  // Layout
  // ─────────────────────────────────────────────

  final double? width;
  final double? height;
  final double? borderRadius;
  final double iconGap;

  // ─────────────────────────────────────────────
  // Style
  // ─────────────────────────────────────────────

  final TextStyle? textStyle;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final bool isEnabled = enabled && onPressed != null;

    // ─────────────────────────────────────────
    // Background Color
    // ─────────────────────────────────────────

    final Color effectiveBackgroundColor =
        backgroundColor ?? theme.colorScheme.primary;

    final Color effectiveDisabledBackgroundColor =
        disabledBackgroundColor ?? AppColors.disabled;

    // ─────────────────────────────────────────
    // Text Color
    // ─────────────────────────────────────────

    final Color effectiveTextColor = isEnabled
        ? theme.colorScheme.onPrimary
        : (disabledTextColor ?? AppColors.textSecondary);

    // ─────────────────────────────────────────
    // Text Style
    //
    // If the caller provides textStyle,
    // its color/font/etc. are respected.
    // Otherwise the theme's labelMedium is used.
    // ─────────────────────────────────────────

    final TextStyle effectiveTextStyle = textStyle ??
        theme.textTheme.labelMedium!.copyWith(
          color: effectiveTextColor,
        );

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 52,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: effectiveBackgroundColor,
          disabledBackgroundColor: effectiveDisabledBackgroundColor,
          foregroundColor: effectiveTextColor,
          elevation: elevation ?? 0,
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          textStyle: effectiveTextStyle,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? 12,
            ),
            side: enableBorder
                ? BorderSide(
              color: borderColor ?? AppColors.border,
              width: borderWidth,
            )
                : BorderSide.none,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ─────────────────────────────────
            // Pre Icon
            // ─────────────────────────────────

            if (preIcon != null) ...[
              preIcon!,
              SizedBox(width: iconGap),
            ],

            // ─────────────────────────────────
            // Text
            // ─────────────────────────────────

            Text(
              text,
              style: effectiveTextStyle,
            ),

            // ─────────────────────────────────
            // Post Icon
            // ─────────────────────────────────

            if (postIcon != null) ...[
              SizedBox(width: iconGap),
              postIcon!,
            ],
          ],
        ),
      ),
    );
  }
}