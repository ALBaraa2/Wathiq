import 'package:flutter/material.dart';

import '../../../../config/theme/app_colors.dart';

 
class PropertyInputFieldWidget extends StatelessWidget {
  const PropertyInputFieldWidget({
    super.key,
    required this.controller,
    required this.hint,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
  });

  final TextEditingController controller;
  final String hint;
  final String? Function(String? value)? validator;
  final bool obscureText;

  final Widget? suffixIcon;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,

      style: textTheme.bodyLarge?.copyWith(
        color: AppColors.white70,
      ),

      decoration: InputDecoration(
        hintText: hint,

        // The rest of the field styling comes from AppTheme.
        filled: true,
        fillColor: AppColors.cardSelectedBg,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),

        floatingLabelBehavior: FloatingLabelBehavior.never,

        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,

        prefixIconColor: AppColors.textSecondary,
        suffixIconColor: AppColors.textSecondary,

        hintStyle: textTheme.bodyLarge?.copyWith(
          color: AppColors.textSecondary,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.cardBorder,
            width: 1,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.white,
            width: 1,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 1,
          ),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 1,
          ),
        ),

        errorStyle: textTheme.bodySmall?.copyWith(
          color: AppColors.error,
        ),
      ),
    );
  }
}