import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PermissionGrantedSheet extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const PermissionGrantedSheet({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  static Future<void> show(BuildContext context, int currentStep, int totalSteps) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible: true, // Allow user to dismiss
      builder: (context) => PermissionGrantedSheet(
        currentStep: currentStep,
        totalSteps: totalSteps,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF1C1C1E),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Permission Granted',
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: 140,
            height: 140,
            child: Stack(
              children: [
                Center(
                  child: SizedBox(
                    width: 140,
                    height: 140,
                    child: CircularProgressIndicator(
                      value: currentStep / totalSteps,
                      strokeWidth: 8,
                      backgroundColor: const Color(0xFF333333),
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    '$currentStep/$totalSteps',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
