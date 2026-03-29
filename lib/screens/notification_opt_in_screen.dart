import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'free_trial_screen.dart';

class NotificationOptInScreen extends StatelessWidget {
  const NotificationOptInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              // Mockup Card
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
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
                          TextSpan(text: '1h 23m\n', style: TextStyle(color: Color(0xFF00E6A2))),
                          TextSpan(text: 'less on your phone on average'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildBarColumn('Last week', '4h 23m avg', 100, Colors.grey[800]!),
                        _buildBarColumn('This week', '3h 11m avg', 60, const Color(0xFF00E6A2)),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Culprit Apps',
                      style: GoogleFonts.inter(fontSize: 12, color: Colors.grey[400]),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildAppIcon('Instagram', '1h 31m', Icons.camera_alt, Colors.pink),
                        _buildAppIcon('TikTok', '35m', Icons.music_note, Colors.black),
                        _buildAppIcon('Facebook', '29m', Icons.facebook, Colors.blue),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.ios_share, color: Colors.white, size: 16),
                          const SizedBox(width: 8),
                          Text('Share', style: GoogleFonts.inter(color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Text(
                'Get notified about your report',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'We\'ll also let you know when your\nprotection starts and nudge you when\nyour focus is low',
                style: GoogleFonts.inter(
                  color: Colors.grey[400],
                  fontSize: 16,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to Free Trial / Paywall Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FreeTrialScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // Navigate to Free Trial / Paywall Screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FreeTrialScreen(),
                    ),
                  );
                },
                child: Text(
                  'Maybe Later',
                  style: GoogleFonts.inter(
                    color: Colors.grey[400],
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBarColumn(String title, String subtitle, double height, Color color) {
    return Column(
      children: [
        Container(
          width: 48,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 16),
        Text(title, style: GoogleFonts.inter(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
        const SizedBox(height: 4),
        Text(subtitle, style: GoogleFonts.inter(color: color == const Color(0xFF00E6A2) ? color : Colors.grey[500], fontSize: 10)),
      ],
    );
  }

  Widget _buildAppIcon(String name, String time, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(name, style: GoogleFonts.inter(color: Colors.white, fontSize: 12)),
        Text(time, style: GoogleFonts.inter(color: Colors.grey[500], fontSize: 10)),
      ],
    );
  }
}
