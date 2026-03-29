import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/top_progress_bar.dart';
import '../widgets/permission_granted_sheet.dart';
import 'connecting_screen.dart';

class EnableBlockScreen extends StatefulWidget {
  const EnableBlockScreen({super.key});

  @override
  State<EnableBlockScreen> createState() => _EnableBlockScreenState();
}

class _EnableBlockScreenState extends State<EnableBlockScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      PermissionGrantedSheet.show(context, 2, 3);
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
              const TopProgressBar(currentStep: 3, totalSteps: 3),
              const SizedBox(height: 24),
              Text(
                'Enable Opal to Block\nDistracting Apps',
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
                'Don\'t worry, you can take a break any\ntime\nby opening Opal.',
                style: GoogleFonts.inter(
                  color: Colors.grey[300],
                  fontSize: 16,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              // Settings mockup
              Container(
                width: 200,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1A1A), // Subtle dark red tint
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildSettingsRow(Icons.video_camera_back, 'Meet', 'Not allowed', Colors.green),
                    _buildSettingsRow(Icons.present_to_all, 'Mobizen', 'Allowed', Colors.red, isSystem: true),
                    _buildSettingsRow(Icons.circle_outlined, 'Opal', 'Not allowed', Colors.white, isOpal: true),
                    _buildSettingsRow(Icons.phone, 'Phone', 'Allowed', Colors.blue),
                    _buildSettingsRow(Icons.photo, 'Photos', 'Not allowed', Colors.greenAccent),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Steps
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
                            style: GoogleFonts.inter(color: Colors.grey[300], fontSize: 16),
                            children: const [
                              TextSpan(text: 'Find '),
                              TextSpan(text: 'Opal', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                              TextSpan(text: ' in the list of apps'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 48), // Spacing to align with Step 2
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.inter(color: Colors.grey[300], fontSize: 16),
                            children: const [
                              TextSpan(text: 'Toggle '),
                              TextSpan(text: '"Allow display over other\napps"', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
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
                    // Navigate to Connecting Screen to simulate data collection
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ConnectingScreen()),
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
              Text(
                'Learn More',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
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

  Widget _buildSettingsRow(IconData icon, String title, String subtitle, Color color, {bool isSystem = false, bool isOpal = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: isOpal ? Colors.transparent : Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 16, color: color),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: GoogleFonts.inter(color: isOpal ? Colors.white : Colors.grey[300], fontSize: 14, fontWeight: isOpal ? FontWeight.bold : FontWeight.normal)),
              Text(subtitle, style: GoogleFonts.inter(color: Colors.grey[500], fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }
}
