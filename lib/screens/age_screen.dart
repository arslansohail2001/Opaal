import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screen_time_screen.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  String? _selectedAge;

  final List<String> _ageOptions = [
    'Below 18',
    '18-24',
    '25-34',
    '35-44',
    '45-55',
    '55-64',
    'Above 64',
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
                'How old are you?',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'So we can suggest the best setup for you.',
                style: GoogleFonts.inter(
                  color: Colors.grey[400],
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              Expanded(
                child: ListView.separated(
                  itemCount: _ageOptions.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final option = _ageOptions[index];
                    final isSelected = _selectedAge == option;
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selectedAge = option;
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
                  onPressed: _selectedAge == null
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ScreenTimeScreen(),
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
