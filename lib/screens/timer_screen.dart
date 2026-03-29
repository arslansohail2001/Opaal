import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  bool _blockApps = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text('pal', style: GoogleFonts.inter(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey[800]!),
                    ),
                    child: const Icon(Icons.person_outline, color: Colors.grey, size: 20),
                  ),
                ],
              ),
            ),
            
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Circular Progress Ring
                  Container(
                    width: 320,
                    height: 320,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey[900]!, // Background track
                        width: 20,
                      ),
                    ),
                    child: ShaderMask(
                      shaderCallback: (rect) {
                        return const SweepGradient(
                          colors: [Color(0xFFA5FFEA), Color(0xFF6EDFFF), Color(0xFFA5FFEA)],
                          startAngle: 0.0,
                          endAngle: 3.14 * 2,
                        ).createShader(rect);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white, // Masked by shader
                            width: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  // Top Handle inside the ring
                  Positioned(
                    top: 20, // Adjust based on ring size
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: Color(0xFFD4FFEC), // Light mint handle
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black54, blurRadius: 4, offset: Offset(0, 2))
                        ],
                      ),
                    ),
                  ),
                  
                  // Timer Text
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('20', style: GoogleFonts.inter(color: Colors.white, fontSize: 64, fontWeight: FontWeight.bold, height: 1.0)),
                          const SizedBox(width: 8),
                          Text('00', style: GoogleFonts.inter(color: Colors.white, fontSize: 64, fontWeight: FontWeight.bold, height: 1.0)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Min', style: GoogleFonts.inter(color: Colors.grey[500], fontSize: 16)),
                          const SizedBox(width: 48),
                          Text('Sec', style: GoogleFonts.inter(color: Colors.grey[500], fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Bottom Controls
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[900]!),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Block Apps', style: GoogleFonts.inter(color: Colors.white, fontSize: 16)),
                        const SizedBox(width: 16),
                        Switch(
                          value: _blockApps,
                          onChanged: (val) {
                            setState(() {
                              _blockApps = val;
                            });
                          },
                          activeThumbColor: Colors.black,
                          activeTrackColor: Colors.white,
                          inactiveThumbColor: Colors.grey[600],
                          inactiveTrackColor: Colors.grey[900],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow, color: Colors.black),
                      label: Text(
                        'Start Timer',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 48), // Padding for bottom nav
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
