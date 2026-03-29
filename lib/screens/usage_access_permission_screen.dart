import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/top_progress_bar.dart';
import '../widgets/permission_granted_sheet.dart';
import 'enable_block_screen.dart';

class UsageAccessPermissionScreen extends StatefulWidget {
  const UsageAccessPermissionScreen({super.key});

  @override
  State<UsageAccessPermissionScreen> createState() => _UsageAccessPermissionScreenState();
}

class _UsageAccessPermissionScreenState extends State<UsageAccessPermissionScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      PermissionGrantedSheet.show(context, 1, 3);
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
            children: [
              const TopProgressBar(currentStep: 2, totalSteps: 3),
              const SizedBox(height: 24),
              Text(
                'Allow Opal to Monitor\nScreen Time',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'All your information is secure\nand will stay 100% on your phone.',
                style: GoogleFonts.inter(
                  color: Colors.grey[400],
                  fontSize: 16,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              // Settings mockup graphic
              Container(
                width: 220,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1A1A),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildSettingsRow(Icons.g_mobiledata, 'Google', Colors.white, circleBg: Colors.white),
                    _buildSettingsRow(Icons.security, 'Google Play Protect Service', Colors.green),
                    _buildSettingsRow(Icons.play_arrow, 'Google Play services', Colors.blue),
                    _buildSettingsRow(Icons.shop, 'Google Play Store', Colors.greenAccent),
                    _buildSettingsRow(Icons.widgets, 'Nothing Widgets', Colors.grey),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Instructions
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      _buildStepCircle('1'),
                      Container(width: 2, height: 32, color: Colors.grey[800]),
                      _buildStepCircle('2'),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 6),
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.inter(color: Colors.grey[400], fontSize: 16),
                            children: const [
                              TextSpan(text: 'Find '),
                              TextSpan(text: 'Opal', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                              TextSpan(text: ' in the list of apps'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 48), // Spacing
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.inter(color: Colors.grey[400], fontSize: 16),
                            children: const [
                              TextSpan(text: 'Toggle '),
                              TextSpan(text: '"Permit usage access"', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to Enable Block Screen (Top Progress 3/3)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EnableBlockScreen(),
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

  Widget _buildStepCircle(String text) {
    return Container(
      width: 32,
      height: 32,
      decoration: const BoxDecoration(
        color: Color(0xFF333333),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSettingsRow(IconData icon, String title, Color color, {Color? circleBg}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: circleBg ?? Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 16, color: color),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: GoogleFonts.inter(color: Colors.grey[300], fontSize: 12)),
              Text('Allowed', style: GoogleFonts.inter(color: Colors.grey[500], fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }
}
