import 'package:flutter/material.dart';

class AppTheme {
  // Pure Black & Dark Monochromatic Palette (Vercel / Linear / Apple Pro style)
  static const Color background = Color(0xFF000000); // Deep Pitch Black
  static const Color surface = Color(0xFF0A0A0A);
  static const Color surfaceElevated = Color(0xFF121212);
  static const Color surfaceCard = Color(0xFF171717);

  // Border Accents
  static const Color borderLight = Color(
    0x2EFFFFFF,
  ); // Crisp subtle white border
  static const Color borderSubtle = Color(0x1AFFFFFF);
  static const Color borderGlow = Color(0x66FFFFFF); // Bright white glow border

  // Minimal Monochrome Primary & Secondary
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFF5F5F5);
  static const Color gray300 = Color(0xFFD4D4D8);
  static const Color gray400 = Color(0xFFA1A1AA);
  static const Color gray500 = Color(0xFF71717A);
  static const Color gray700 = Color(0xFF3F3F46);
  static const Color gray900 = Color(0xFF18181B);

  // Tasteful Subtle Accent Colors (Mixed into Badges and Indicator highlights)
  static const Color mobileCyan = Color(0xFF38BDF8); // Crisp Cyber Sky
  static const Color backendEmerald = Color(0xFF34D399); // Crisp Emerald
  static const Color springGreen = Color(0xFF4ADE80);
  static const Color accentPurple = Color(0xFFA855F7);

  // Monochromatic Gradients with Subtle Light Reflection
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFA1A1AA)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient monoCardGradient = LinearGradient(
    colors: [Color(0xFF1C1C1E), Color(0xFF111113)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient mobileGradient = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFF38BDF8)],
  );

  static const LinearGradient backendGradient = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFF34D399)],
  );

  //// Text Colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFD4D4D8);
  static const Color textMuted = Color(0xFFA1A1AA);

  // Premium Monochromatic Glassmorphic Box
  static BoxDecoration glassBox({
    Color? color,
    Color? borderColor,
    double borderRadius = 16,
    double borderWidth = 1,
    List<BoxShadow>? shadows,
  }) {
    return BoxDecoration(
      color: color ?? const Color(0xFF121212).withValues(alpha: 0.9),
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(color: borderColor ?? borderLight, width: borderWidth),
      boxShadow:
          shadows ??
          [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.7),
              blurRadius: 24,
              offset: const Offset(0, 10),
            ),
          ],
    );
  }
}
