import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final List<Color> colors;

  const GradientText(
    this.text, {
    super.key,
    required this.fontSize,
    this.fontWeight = FontWeight.bold,
    this.colors = const [Color(0xFFA563FF), Color(0xFF63A4FF)], // Default Purple to Cyan/Blue
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: colors,
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(bounds),
      child: Text(
        text,
        style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: 1.1,
        ),
      ),
    );
  }
}
