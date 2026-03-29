import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/circular_app_chart.dart';
import 'bad_news_screen.dart';

class ReportSavingsScreen extends StatelessWidget {
  const ReportSavingsScreen({super.key});

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
              const SizedBox(height: 48),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                  children: const [
                    TextSpan(text: 'A week with Opal can cut\nthat time by '),
                    TextSpan(
                      text: '30%',
                      style: TextStyle(color: Color(0xFF00E6A2)), // Vibrant Green
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 1),
              Stack(
                alignment: Alignment.center,
                children: [
                  const CircularAppChart(showSavings: true),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '1h 4m',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '-30% saved with Opal',
                        style: GoogleFonts.inter(
                          color: const Color(0xFF00E6A2),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(flex: 1),
              Text(
                '...and offer you better focus,\nmore fun, and better sleep',
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BadNewsScreen(),
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
            ],
          ),
        ),
      ),
    );
  }
}
