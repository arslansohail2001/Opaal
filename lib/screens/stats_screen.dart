import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

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
            
            // Date Selector
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[900],
                    ),
                    child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                  ),
                  Text('Mar 23 – 29', style: GoogleFonts.inter(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[900],
                    ),
                    child: const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                  ),
                ],
              ),
            ),

            // Report Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2A0000), Color(0xFF1E1E1E)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                        ),
                        children: const [
                          TextSpan(text: 'This week, you spent '),
                          TextSpan(text: '1h 29m\n', style: TextStyle(color: Color(0xFFFF4B6E))), // Red color
                          TextSpan(text: 'more on your phone on average'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 48),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildBarColumn('Last week', '2h 6m daily avg', 120, Colors.grey[800]!),
                        _buildBarColumn('This week', '3h 35m daily avg', 200, const Color(0xFFFF4B6E)), // Gradient red bar
                      ],
                    ),
                    const SizedBox(height: 32),
                    Divider(color: Colors.grey[900]),
                    const SizedBox(height: 16),
                    Text(
                      'Culprit Apps',
                      style: GoogleFonts.inter(fontSize: 14, color: Colors.grey[400], fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildAppIcon(Icons.message, Colors.green),
                        _buildAppIcon(Icons.music_note, Colors.black, border: Colors.white),
                        _buildAppIcon(Icons.camera_alt, Colors.pink),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.share, color: Colors.white, size: 18),
                          const SizedBox(width: 8),
                          Text('Share', style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBarColumn(String title, String subtitle, double height, Color color) {
    return Column(
      children: [
        Container(
          width: 56,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        const SizedBox(height: 16),
        Text(title, style: GoogleFonts.inter(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
        const SizedBox(height: 4),
        Text(subtitle, style: GoogleFonts.inter(color: color == const Color(0xFFFF4B6E) ? color : Colors.grey[500], fontSize: 12)),
      ],
    );
  }

  Widget _buildAppIcon(IconData icon, Color bg, {Color? border}) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: bg,
        shape: BoxShape.circle,
        border: border != null ? Border.all(color: border, width: 2) : null,
      ),
      child: Center(
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }
}
