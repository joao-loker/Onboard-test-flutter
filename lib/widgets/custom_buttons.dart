import 'package:flutter/material.dart';

class ButtonSizes {
  static const double md = 48.0;
  static const double xxs = 24.0;
  static const double none = 0.0;
}

class ButtonColors {
  static const Color primaryBackground = Color(0xFF121212);
  static const Color secondaryBackground = Color(0xFFEEEEEE);
  static const Color primaryText = Color(0xFF121212);
  static const Color secondaryText = Color(0xFFF5F5F5);
}

class CustomButtons {
  static const TextStyle _buttonTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1,
  );

  static Widget primaryButton({
    required String text,
    required VoidCallback onPressed,
    double? width,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: ButtonSizes.md,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: ButtonSizes.xxs),
        decoration: ShapeDecoration(
          color: ButtonColors.primaryBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100000),
          ),
          shadows: [
            BoxShadow(
              color: ButtonColors.primaryBackground.withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: _buttonTextStyle.copyWith(
              color: ButtonColors.secondaryText,
            ),
          ),
        ),
      ),
    );
  }

  static Widget secondaryButton({
    required String text,
    required VoidCallback onPressed,
    double? width,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: ButtonSizes.md,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: ButtonSizes.xxs),
        decoration: ShapeDecoration(
          color: ButtonColors.secondaryBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100000),
          ),
          shadows: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: _buttonTextStyle.copyWith(
              color: ButtonColors.primaryText,
            ),
          ),
        ),
      ),
    );
  }
} 