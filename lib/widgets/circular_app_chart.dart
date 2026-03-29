import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CircularAppChart extends StatelessWidget {
  final bool showSavings;

  const CircularAppChart({super.key, this.showSavings = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 280,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(280, 280),
            painter: _ChartPainter(showSavings: showSavings),
          ),
          // Add dummy floating icons around the ring
          _buildFloatingIcon(Icons.camera_alt, Colors.purple, -pi / 4, 140),
          _buildFloatingIcon(CupertinoIcons.circle, Colors.yellow, -pi / 2.2, 140),
          _buildFloatingIcon(Icons.video_library, Colors.blue, pi / 1.5, 140),
          _buildTextLabel('Other Apps', -pi / 2.2, 180),
        ],
      ),
    );
  }

  Widget _buildFloatingIcon(IconData icon, Color bg, double angle, double radius) {
    return Transform.translate(
      offset: Offset(radius * cos(angle), radius * sin(angle)),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: bg,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 16),
      ),
    );
  }
  
  Widget _buildTextLabel(String text, double angle, double radius) {
    return Transform.translate(
      offset: Offset(radius * cos(angle), radius * sin(angle)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.grey[900]?.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}

class _ChartPainter extends CustomPainter {
  final bool showSavings;

  _ChartPainter({required this.showSavings});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    const strokeWidth = 24.0;

    final darkPaint = Paint()
      ..color = const Color(0xFF3D1220) // Maroon/Dark Red
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
      
    final darkGreyPaint = Paint()
      ..color = const Color(0xFF333333) // Dark Grey for normal mode
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final greenPaint = Paint()
      ..color = const Color(0xFF00E6A2) // Vibrant Green
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromCircle(center: center, radius: radius);

    // Draw base ring
    // We break it into multiple arcs to look like segment breaks
    for (int i = 0; i < 4; i++) {
      final startAngle = (i * pi / 2) + 0.1;
      final sweepAngle = (pi / 2) - 0.2;
      canvas.drawArc(rect, startAngle, sweepAngle, false, showSavings ? darkGreyPaint : darkPaint);
    }

    // Draw green savings
    if (showSavings) {
      canvas.drawArc(rect, pi - 0.2, (pi / 2) + 0.4, false, greenPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


