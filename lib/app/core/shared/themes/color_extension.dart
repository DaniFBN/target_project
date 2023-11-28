import 'package:flutter/material.dart';

class ColorExtension extends ThemeExtension<ColorExtension> {
  final List<Color> gradient;

  const ColorExtension({
    required this.gradient,
  });

  @override
  ThemeExtension<ColorExtension> lerp(
    covariant ThemeExtension<ColorExtension>? other,
    double t,
  ) {
    if (other == null || t < 0.5) return this;
    return other;
  }

  @override
  ColorExtension copyWith({
    List<Color>? gradient,
  }) {
    return ColorExtension(
      gradient: gradient ?? this.gradient,
    );
  }
}
