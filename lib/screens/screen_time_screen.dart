import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'news_intro_screen.dart';

class ScreenTimeScreen extends StatefulWidget {
  const ScreenTimeScreen({super.key});

  @override
  State<ScreenTimeScreen> createState() => _ScreenTimeScreenState();
}

class _ScreenTimeScreenState extends State<ScreenTimeScreen> {
  String? _selectedTime;

  final List<String> _timeOptions = [
    'Under 1 hour',
    '1-3 hours',
    '3-4 hours',
    '4-5 hours',
    '5-7 hours',
    'More than 7 hours',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 48),
              Text(
                'What is your daily\naverage Screen Time?',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'On your phone only. Your best guess is ok.',
                style: GoogleFonts.inter(
                  color: Colors.grey[400],
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              Expanded(
                child: ListView.separated(
                  itemCount: _timeOptions.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final option = _timeOptions[index];
                    final isSelected = _selectedTime == option;
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selectedTime = option;
                        });
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.grey[800] : const Color(0xFF1C1C1E),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected ? Colors.white : Colors.transparent,
                            width: 1,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          option,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: _selectedTime == null
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NewsIntroScreen(),
                            ),
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1C1C1E),
                    disabledBackgroundColor: const Color(0xFF1C1C1E),
                    foregroundColor: Colors.white,
                    disabledForegroundColor: Colors.grey[600],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 0,
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
