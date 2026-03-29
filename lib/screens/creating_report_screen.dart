import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'report_summary_screen.dart';

class CreatingReportScreen extends StatefulWidget {
  const CreatingReportScreen({super.key});

  @override
  State<CreatingReportScreen> createState() => _CreatingReportScreenState();
}

class _CreatingReportScreenState extends State<CreatingReportScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
        setState(() {});
      });
      
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward().then((_) {
      // Automatically navigate to Home after report generation
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ReportSummaryScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Creating report...',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 8,
                      color: const Color(0xFF333333),
                    ),
                    FractionallySizedBox(
                      widthFactor: _animation.value,
                      child: Container(
                        height: 8,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFFA563FF), Color(0xFF00E5FF)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
