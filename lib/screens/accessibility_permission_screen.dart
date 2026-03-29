import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/top_progress_bar.dart';
import 'usage_access_permission_screen.dart';

class AccessibilityPermissionScreen extends StatefulWidget {
  const AccessibilityPermissionScreen({super.key});

  @override
  State<AccessibilityPermissionScreen> createState() => _AccessibilityPermissionScreenState();
}

class _AccessibilityPermissionScreenState extends State<AccessibilityPermissionScreen> {
  bool _showPopup = false;

  @override
  void initState() {
    super.initState();
    // Simulate showing the popup automatically or on button press
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _showPopup = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
              child: Column(
                children: [
                  const TopProgressBar(currentStep: 1, totalSteps: 3),
                  const SizedBox(height: 24),
                  Text(
                    'Enable\nAccessibility Permission',
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
                    'This lets Opal detect the app currently\nactive, so it can block distractions.\nWe never track or read your screen\ncontent.',
                    style: GoogleFonts.inter(
                      color: Colors.grey[300],
                      fontSize: 16,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                         setState(() {
                           _showPopup = true;
                         });
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
                      color: Colors.grey[400],
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            if (_showPopup)
              Container(
                color: Colors.black.withValues(alpha: 0.7),
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Why Accessibility is needed',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Opal uses the Accessibility\npermission to detect which app\nyou\'re currently using, so it can\nblock distracting apps during\nfocus sessions.\nWe do NOT:\n• Read or collect screen content\n• Record any personal data\n• Track your actions outside Opal',
                          style: GoogleFonts.inter(
                            color: Colors.grey[300],
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const UsageAccessPermissionScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child: const Text('Continue'),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _showPopup = false;
                              });
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.red[300],
                            ),
                            child: const Text('Decline'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
