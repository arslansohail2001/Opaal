import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlockConfigScreen extends StatefulWidget {
  final bool isInitialSchedule; // true for Schedule, false for Timer

  const BlockConfigScreen({super.key, this.isInitialSchedule = false});

  @override
  State<BlockConfigScreen> createState() => _BlockConfigScreenState();
}

class _BlockConfigScreenState extends State<BlockConfigScreen> {
  late bool isSchedule;
  final List<String> days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
  final List<bool> selectedDays = [true, true, true, true, true, false, false];

  @override
  void initState() {
    super.initState();
    isSchedule = widget.isInitialSchedule;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        // Starry night deep space gradient
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0D1B2A), Color(0xFF1B263B), Colors.black],
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
                      const SizedBox(height: 100), // Space pushing down to mimic screenshots
                      
                      // Segmented Toggle
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () => setState(() => isSchedule = true),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  decoration: BoxDecoration(
                                    color: isSchedule ? Colors.white.withValues(alpha: 0.15) : Colors.transparent,
                                    borderRadius: BorderRadius.circular(26),
                                  ),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.schedule, color: Colors.white, size: 16),
                                      const SizedBox(width: 8),
                                      Text('Schedule', style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => setState(() => isSchedule = false),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  decoration: BoxDecoration(
                                    color: !isSchedule ? Colors.white.withValues(alpha: 0.15) : Colors.transparent,
                                    borderRadius: BorderRadius.circular(26),
                                  ),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.play_arrow, color: Colors.white, size: 16),
                                      const SizedBox(width: 8),
                                      Text('Timer', style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Title Input
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                        ),
                        child: TextField(
                          style: GoogleFonts.inter(color: Colors.white, fontSize: 18),
                          decoration: InputDecoration(
                            icon: Text(isSchedule ? '💎' : '🧘‍♀️', style: const TextStyle(fontSize: 24)),
                            hintText: isSchedule ? 'My Event' : 'Quiet Quest',
                            hintStyle: GoogleFonts.inter(color: Colors.grey[400]),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Time Config (Differs by mode)
                      if (!isSchedule) ...[
                        _buildSettingRow('Duration', '30min'),
                      ] else ...[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.05),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                          ),
                          child: Column(
                            children: [
                              _buildSettingRow('From', '02:00 PM', showTopBorder: false),
                              _buildSettingRow('To', '04:00 PM', showTopBorder: false),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Days selector
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
                              Text('On these days:', style: GoogleFonts.inter(color: Colors.grey[400], fontSize: 14)),
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
                      ],
                      const SizedBox(height: 16),

                      // Apps Blocked
                      _buildSettingRow('Apps Blocked', '⭕', iconVal: true),
                      const SizedBox(height: 16),

                      // Breaks Allowed
                      _buildSettingRow('Breaks Allowed', 'Make it harder'),
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
                            isSchedule ? 'Start Schedule' : 'Start Timer',
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

  Widget _buildSettingRow(String title, String value, {bool showTopBorder = false, bool iconVal = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: showTopBorder ? Colors.transparent : Colors.white.withValues(alpha: 0.05),
        borderRadius: showTopBorder ? BorderRadius.zero : BorderRadius.circular(16),
        border: showTopBorder ? null : Border.all(color: Colors.white.withValues(alpha: 0.1)),
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
                  child: const Center(child: Icon(Icons.app_shortcut, size: 14, color: Colors.blue)), // Mock Chrome
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
}
