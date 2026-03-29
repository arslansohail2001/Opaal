import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeLimitScreen extends StatefulWidget {
  const TimeLimitScreen({super.key});

  @override
  State<TimeLimitScreen> createState() => _TimeLimitScreenState();
}

class _TimeLimitScreenState extends State<TimeLimitScreen> {
  final List<String> days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
  final List<bool> selectedDays = [true, true, true, true, true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF160D2A), Color(0xFF1B263B), Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.4, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 120), // Spacer down to content
                      
                      // Title
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                        ),
                        child: Row(
                          children: [
                            const Text('⏳', style: TextStyle(fontSize: 24)),
                            const SizedBox(width: 16),
                            Text('Time Wizard', style: GoogleFonts.inter(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Apps Blocked Setup
                      _buildSettingRow('Apps Blocked', '⭕', iconVal: true),
                      const SizedBox(height: 16),

                      // Allowance Settings Group
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                        ),
                        child: Column(
                          children: [
                            // Time Allowed Stepper
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Time Allowed', style: GoogleFonts.inter(color: Colors.white, fontSize: 16)),
                                      const SizedBox(height: 4),
                                      Text('Per Day', style: GoogleFonts.inter(color: Colors.grey[500], fontSize: 12)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      _buildStepperBtn(Icons.remove),
                                      const SizedBox(width: 12),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                                        child: Text('1h', style: GoogleFonts.inter(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
                                      ),
                                      const SizedBox(width: 12),
                                      _buildStepperBtn(Icons.add),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: Colors.white.withValues(alpha: 0.1), height: 1),
                            _buildSettingRow('Then Block Until', 'Tomorrow', noBg: true),
                            Divider(color: Colors.white.withValues(alpha: 0.1), height: 1),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Reset Allowed', style: GoogleFonts.inter(color: Colors.white, fontSize: 16)),
                                  Row(
                                    children: [
                                      const Icon(Icons.shield_outlined, color: Colors.grey, size: 16),
                                      const SizedBox(width: 4),
                                      Text('Yes', style: GoogleFonts.inter(color: Colors.grey[400], fontSize: 16)),
                                      const SizedBox(width: 8),
                                      const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Days Config
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('On these days', style: GoogleFonts.inter(color: Colors.grey[400], fontSize: 14)),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(7, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedDays[index] = !selectedDays[index];
                                    });
                                  },
                                  child: Container(
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      color: selectedDays[index] ? Colors.white : Colors.white.withValues(alpha: 0.1),
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      days[index],
                                      style: GoogleFonts.inter(
                                        color: selectedDays[index] ? Colors.black : Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Action Button
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                          ),
                          child: Text(
                            'Save',
                            style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingRow(String title, String value, {bool iconVal = false, bool noBg = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: noBg ? Colors.transparent : Colors.white.withValues(alpha: 0.05),
        borderRadius: noBg ? BorderRadius.zero : BorderRadius.circular(16),
        border: noBg ? null : Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: GoogleFonts.inter(color: Colors.white, fontSize: 16)),
          Row(
            children: [
              if (iconVal)
                Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(child: Icon(Icons.app_shortcut, size: 14, color: Colors.red)),
                )
              else
                Text(value, style: GoogleFonts.inter(color: Colors.grey[400], fontSize: 16)),
              const SizedBox(width: 8),
              const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStepperBtn(IconData icon) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }
}
