import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'creating_report_screen.dart';

class ConnectingScreen extends StatefulWidget {
  const ConnectingScreen({super.key});

  @override
  State<ConnectingScreen> createState() => _ConnectingScreenState();
}

class _ConnectingScreenState extends State<ConnectingScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });

    _controller.forward().then((_) {
      // Automatically navigate to Creating Report once progress is complete
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CreatingReportScreen()),
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
                'Connecting to your Screen Time...',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: _controller.value,
                  backgroundColor: const Color(0xFF333333),
                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFA563FF)),
                  minHeight: 8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
