import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/circular_app_chart.dart';
import '../widgets/permission_granted_sheet.dart';
import 'report_savings_screen.dart';

class ReportSummaryScreen extends StatefulWidget {
  const ReportSummaryScreen({super.key});

  @override
  State<ReportSummaryScreen> createState() => _ReportSummaryScreenState();
}

class _ReportSummaryScreenState extends State<ReportSummaryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      PermissionGrantedSheet.show(context, 3, 3);
    });
  }

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
                    TextSpan(text: 'Last week, you spent '),
                    TextSpan(
                      text: '3h\n35m',
                      style: TextStyle(color: Color(0xFFFF5252)), // Redish color
                    ),
                    TextSpan(text: ' on your phone daily'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'You\'re on track to spend 9 years of your life\nlooking at a screen',
                style: GoogleFonts.inter(
                  color: Colors.grey[400],
                  fontSize: 14,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 1),
              Stack(
                alignment: Alignment.center,
                children: [
                  const CircularAppChart(showSavings: false),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '3h 35m',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'daily average screen time',
                        style: GoogleFonts.inter(
                          color: Colors.grey[500],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(flex: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lock_open, color: Colors.grey[300], size: 20),
                      const SizedBox(width: 8),
                      Text('Phone Unlocks', style: GoogleFonts.inter(color: Colors.grey[400], fontSize: 14)),
                    ],
                  ),
                  Text('179', style: GoogleFonts.inter(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.cloud_off, color: Colors.grey[300], size: 20),
                      const SizedBox(width: 8),
                      Text('% of day offline', style: GoogleFonts.inter(color: Colors.grey[400], fontSize: 14)),
                    ],
                  ),
                  Text('85%', style: GoogleFonts.inter(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
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
                        builder: (context) => const ReportSavingsScreen(),
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
