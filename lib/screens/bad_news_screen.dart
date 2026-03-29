import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/top_progress_bar.dart';
import '../widgets/gradient_text.dart';
import 'good_news_screen.dart';

class BadNewsScreen extends StatelessWidget {
  const BadNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Column(
            children: [
              const TopProgressBar(currentStep: 1, totalSteps: 3),
              const Spacer(flex: 1),
              Text(
                'The bad news is that you\'ll spend 103\n'
                'days on your phone this year.\n'
                'Meaning that you\'re on track to spend',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const GradientText(
                '20 years',
                fontSize: 64,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 16),
              Text(
                'of your life looking down at your\nphone.\nYep, you read this right.',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 1),
              Text(
                'Projection of your current Screen Time habits,\n'
                'based on an average 16 waking hours each day.',
                style: GoogleFonts.inter(
                  color: Colors.grey[500],
                  fontSize: 12,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GoodNewsScreen(),
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
