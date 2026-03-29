import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/top_progress_bar.dart';
import '../widgets/gradient_text.dart';
import 'apps_to_block_screen.dart';

class GoodNewsScreen extends StatelessWidget {
  const GoodNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Column(
            children: [
              const TopProgressBar(currentStep: 2, totalSteps: 3),
              const Spacer(flex: 1),
              Text(
                'The good news is that Opal can help\nyou get back',
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
                '6+ years',
                fontSize: 64,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 16),
              Text(
                'of your life free from distractions,\nand help you achieve your dreams.',
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
                'According to your profile combined with Opal program',
                style: GoogleFonts.inter(
                  color: Colors.grey[500],
                  fontSize: 12,
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
                        builder: (context) => const AppsToBlockScreen(),
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
