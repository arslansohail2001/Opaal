import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notification_opt_in_screen.dart';

class FistBumpScreen extends StatelessWidget {
  const FistBumpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationOptInScreen(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),
                Text(
                  'This week, based on our\ndata, Opal can help you:',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 48),
                _buildCheckRow('Reduce your Screen Time by 30%, to\n3h32m each day'),
                const SizedBox(height: 32),
                _buildCheckRow('Reduce work hour distraction to\n<20%'),
                const SizedBox(height: 32),
                _buildCheckRow('Become 30% more focused than the\naverage of your peers'),
                const SizedBox(height: 32),
                _buildCheckRow('Develop habits to save 30d this year'),
                const Spacer(),
                Center(
                  child: Text(
                    '👊',
                    style: TextStyle(fontSize: 100),
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Let\'s solidify it with a fist bump',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  'Tap to continue',
                  style: GoogleFonts.inter(
                    color: Colors.grey[500],
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCheckRow(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            color: Color(0xFF007AFF), // iOS blue
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check, color: Colors.white, size: 16),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 16,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
