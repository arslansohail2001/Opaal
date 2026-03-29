import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sign_up_screen.dart';

class FreeTrialScreen extends StatelessWidget {
  const FreeTrialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Restore', style: GoogleFonts.inter(color: Colors.grey[500], fontSize: 14)),
                    IconButton(
                      icon: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.close, color: Colors.white, size: 16),
                      ),
                      onPressed: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Split Mockup Widget
                Row(
                  children: [
                    Expanded(child: _buildChartMockup('Before\nOpal', '6h 32m', true)),
                    const SizedBox(width: 8),
                    Expanded(child: _buildChartMockup('After\nOpal', '1h 49m', false)),
                  ],
                ),
                const SizedBox(height: 48),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                    children: const [
                      TextSpan(text: 'Start your free trial and gain\n'),
                      TextSpan(text: '2+ Hours ', style: TextStyle(color: Color(0xFFA563FF))),
                      TextSpan(text: 'back'),
                    ],
                  ),
                ),
                const SizedBox(height: 48),
                _buildBenefitRow(Icons.lock, 'Focus, uninterrupted.', 'Finally do\nyour best work yet.'),
                const SizedBox(height: 32),
                _buildBenefitRow(Icons.calendar_today, 'Own your time.', 'And fill your\ndays with more intention.'),
                const SizedBox(height: 32),
                _buildBenefitRow(Icons.group, 'Be fully present.', 'Because life\nisn\'t happening on your screen.'),
                const SizedBox(height: 48),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) => const Icon(Icons.star, color: Colors.amber, size: 16)),
                    ),
                    const SizedBox(height: 8),
                    Text('100,000+ Reviews', style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('Join 8 Millions+ people using Opal', style: GoogleFonts.inter(color: Colors.grey[500], fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 32),
                // Fake logos row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.newspaper, color: Colors.white, size: 32),
                    const SizedBox(width: 24),
                    Text('WSJ', style: GoogleFonts.ptSerif(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 24),
                    Icon(Icons.brush, color: Colors.white, size: 32),
                  ],
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF007AFF), // Blue color for CTA
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: Text(
                      'Try for PKR0.00',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBenefitRow(IconData icon, String boldText, String lightText) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: GoogleFonts.inter(color: Colors.white, fontSize: 16, height: 1.4),
              children: [
                TextSpan(text: '$boldText ', style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: lightText, style: TextStyle(color: Colors.grey[300])),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChartMockup(String title, String time, bool high) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(title, style: GoogleFonts.inter(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Daily Average', style: GoogleFonts.inter(color: Colors.grey[500], fontSize: 10)),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(time, style: GoogleFonts.inter(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildMiniBar(high ? 40 : 10),
              _buildMiniBar(high ? 60 : 15),
              _buildMiniBar(high ? 70 : 12),
              _buildMiniBar(high ? 45 : 18),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMiniBar(double height) {
    return Container(
      width: 16,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFF007AFF),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
      ),
    );
  }
}
