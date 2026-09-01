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
    this.iconGap,
    this.textStyle,
    this.elevation,
    this.disabledBackgroundColor,
    this.disabledTextColor,
    this.iconSize,
  });

  final String text;
  final VoidCallback? onPressed;

  final bool enabled;

  final Color? backgroundColor;
  final Color? disabledBackgroundColor;
  final Color? disabledTextColor;

  final bool enableBorder;
  final Color? borderColor;
  final double borderWidth;

  final Widget? preIcon;
  final Widget? postIcon;

  /// Optional override.
  /// Defaults to responsive double.infinity.
  final double? width;

  /// Optional override.
  /// Defaults to responsive Figma height of 56.
  final double? height;

  /// Optional override.
  /// Defaults to responsive Figma radius of 50.
  final double? borderRadius;

  /// Optional override.
  /// Defaults to responsive Figma gap of 13.
  final double? iconGap;

  /// Optional override.
  /// If null, the widget uses the app theme with responsive
  /// Figma typography values.
  final TextStyle? textStyle;

  final double? elevation;

  /// Optional override.
  /// Defaults to responsive Figma icon size of 20.
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Figma reference dimensions.
    const double figmaWidth = 393;
    const double figmaHeight = 852;

    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;

    final double widthScale = screenWidth / figmaWidth;
    final double heightScale = screenHeight / figmaHeight;

    // ------------------------------------------------------------
    // Responsive defaults based on the Figma design.
    // ------------------------------------------------------------

    const double figmaButtonHeight = 56;
    const double figmaBorderRadius = 50;
    const double figmaIconGap = 13;
    const double figmaIconSize = 20;
    const double figmaFontSize = 16;
    const double figmaLineHeight = 24;

    final double effectiveHeight =
        height ?? (figmaButtonHeight * heightScale);

    final double effectiveBorderRadius =
        borderRadius ?? (figmaBorderRadius * widthScale);

    final double effectiveIconGap =
        iconGap ?? (figmaIconGap * widthScale);

    final double effectiveIconSize =
        iconSize ?? (figmaIconSize * widthScale);

    // ------------------------------------------------------------
    // Button state.
    // ------------------------------------------------------------

    final bool isEnabled = enabled && onPressed != null;

    final Color effectiveBackgroundColor =
        backgroundColor ?? theme.colorScheme.primary;

    final Color effectiveDisabledBackgroundColor =
        disabledBackgroundColor ?? AppColors.disabled;

    final Color effectiveTextColor = isEnabled
        ? (textStyle?.color ?? theme.colorScheme.onPrimary)
        : (disabledTextColor ?? AppColors.textSecondary);

    // ------------------------------------------------------------
    // Responsive text style.
    // ------------------------------------------------------------

    final TextStyle effectiveTextStyle =
    (textStyle ??
        theme.textTheme.bodyMedium?.copyWith(
          fontSize: figmaFontSize * widthScale,
          height: figmaLineHeight / figmaFontSize,
          fontWeight: FontWeight.w500,
        ) ??
        TextStyle(
          fontSize: figmaFontSize * widthScale,
          height: figmaLineHeight / figmaFontSize,
          fontWeight: FontWeight.w500,
        ))
        .copyWith(
      color: effectiveTextColor,
    );

    // ------------------------------------------------------------
    // Responsive icon wrapper.
    // ------------------------------------------------------------

    Widget? buildIcon(Widget? icon) {
      if (icon == null) {
        return null;
      }

      return SizedBox(
        width: effectiveIconSize,
        height: effectiveIconSize,
        child: icon,
      );
    }

    final Widget? effectivePreIcon = buildIcon(preIcon);
    final Widget? effectivePostIcon = buildIcon(postIcon);

    // ------------------------------------------------------------
    // Button.
    // ------------------------------------------------------------

    return SizedBox(
      width: width ?? double.infinity,
      height: effectiveHeight,
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
              effectiveBorderRadius,
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
            if (effectivePreIcon != null) ...[
              effectivePreIcon,
              SizedBox(width: effectiveIconGap),
            ],

            Text(
              text,
              style: effectiveTextStyle,
            ),

            if (effectivePostIcon != null) ...[
              SizedBox(width: effectiveIconGap),
              effectivePostIcon,
            ],
          ],
        ),
      ),
    );
  }
}